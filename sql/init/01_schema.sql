USE TicketDB;


-- Table admins (login accounts of administrators for the console program) -------------------------------------------
CREATE TABLE admins (
    admin_id      INT AUTO_INCREMENT PRIMARY KEY,
    email         VARCHAR(100) NOT NULL,
    password_hash CHAR(64)     NOT NULL,
    role          VARCHAR(30)  NOT NULL DEFAULT 'admin',
    is_active     BOOLEAN      NOT NULL DEFAULT TRUE,
    created_at    TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,

    -- Prevents two administrator accounts with the same email
    UNIQUE (email)
) ENGINE=InnoDB;

-- Table categories ----------------------------------------------------------------------------------------------------
CREATE TABLE categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    name        VARCHAR(50) NOT NULL,

    -- Prevents duplicate category names such as two 'Cinema' entries
    UNIQUE (name)
) ENGINE=InnoDB;

-- Table locations -----------------------------------------------------------------------------------------------------
CREATE TABLE locations (
    location_id INT AUTO_INCREMENT PRIMARY KEY,
    name        VARCHAR(100) NOT NULL,
    city        VARCHAR(80)  NOT NULL,
    address     VARCHAR(150) NOT NULL,

    -- Prevents duplicate location with the same name in the same city while allowing the same name in different cities
    UNIQUE (name, city)
) ENGINE=InnoDB;

-- Table events (many-to-one with categories and locations) ----------------------------------------------------------
CREATE TABLE events (
    event_id    INT AUTO_INCREMENT PRIMARY KEY,
    category_id INT          NOT NULL,
    location_id INT          NOT NULL,
    title       VARCHAR(150) NOT NULL,
    starts_at   DATETIME     NOT NULL,
    price       DECIMAL(8,2) NOT NULL,

    -- Prevents deleting a category or location while events still reference it
    CONSTRAINT fk_events_category
        FOREIGN KEY (category_id)
        REFERENCES categories(category_id)
        ON DELETE RESTRICT,
    CONSTRAINT fk_events_location
        FOREIGN KEY (location_id)
        REFERENCES locations(location_id)
        ON DELETE RESTRICT,

    -- Prevents scheduling the exact same event at the same location and start time twice
    UNIQUE (location_id, title, starts_at)
) ENGINE=InnoDB;

-- Table users ---------------------------------------------------------------------------------------------------------
CREATE TABLE users (
    user_id   INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email     VARCHAR(100) NOT NULL,

    -- Prevents creating two user accounts with the same email address
    UNIQUE (email)
) ENGINE=InnoDB;

-- Table tickets (many-to-many between users and events) -------------------------------------------------------------
CREATE TABLE tickets (
    ticket_id  INT AUTO_INCREMENT PRIMARY KEY,
    user_id    INT          NOT NULL,
    event_id   INT          NOT NULL,
    seat_label VARCHAR(10)  NOT NULL,
    price      DECIMAL(8,2) NOT NULL,

    -- Prevents deleting a user or an event while tickets still reference it
    CONSTRAINT fk_tickets_user
        FOREIGN KEY (user_id)
        REFERENCES users(user_id)
        ON DELETE RESTRICT,
    CONSTRAINT fk_tickets_event
        FOREIGN KEY (event_id)
        REFERENCES events(event_id)
        ON DELETE RESTRICT,

    -- Prevents double selling: the same seat cannot be sold twice for the same event
    UNIQUE (event_id, seat_label)
) ENGINE=InnoDB;