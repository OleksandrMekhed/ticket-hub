SELECT VERSION() AS mysql_version,
    DATABASE() AS current_database;

USE TicketDB;

-- Table categories ----------------------------------------------------------------------------------------------------
CREATE TABLE categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    name        VARCHAR(50) NOT NULL,

    -- Prevents duplicate category names such as two 'Cinema' entries
    UNIQUE (name)
);

-- Table locations -----------------------------------------------------------------------------------------------------
CREATE TABLE locations (
    location_id INT AUTO_INCREMENT PRIMARY KEY,
    name        VARCHAR(100) NOT NULL,
    city        VARCHAR(80)  NOT NULL,
    address     VARCHAR(150) NOT NULL,

    -- Prevents duplicate location with the same name in the same city while allowing the same name in different cities
    UNIQUE (name, city)
);

-- Table events (many-to-one with categories and locations) ----------------------------------------------------------
CREATE TABLE events (
    event_id    INT AUTO_INCREMENT PRIMARY KEY,
    category_id INT          NOT NULL,
    location_id INT          NOT NULL,
    title       VARCHAR(150) NOT NULL,
    starts_at   DATETIME     NOT NULL,
    price       DECIMAL(8,2) NOT NULL,

    -- Ensures every event belongs to an existing category
    FOREIGN KEY (category_id) REFERENCES categories(category_id),
    -- Ensures every event takes place at an existing location
    FOREIGN KEY (location_id) REFERENCES locations(location_id),

    -- Prevents scheduling the exact same event at the same location and start time twice
    UNIQUE (location_id, title, starts_at)
);

-- Table users ---------------------------------------------------------------------------------------------------------
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name    VARCHAR(100) NOT NULL,
    email   VARCHAR(100) NOT NULL,

    -- Prevents creating two user accounts with the same email address
    UNIQUE (email)
);

-- Table tickets (many-to-many between users and events) -------------------------------------------------------------
CREATE TABLE tickets (
    ticket_id  INT AUTO_INCREMENT PRIMARY KEY,
    user_id    INT          NOT NULL,
    event_id   INT          NOT NULL,
    seat_label VARCHAR(10)  NOT NULL,
    price      DECIMAL(8,2) NOT NULL,

    -- Ensures every ticket is assigned to an existing user
    FOREIGN KEY (user_id)  REFERENCES users(user_id),
    -- Ensures every ticket is issued for an existing event
    FOREIGN KEY (event_id) REFERENCES events(event_id),

    -- Prevents double selling: the same seat cannot be sold twice for the same event
    UNIQUE (event_id, seat_label)
);