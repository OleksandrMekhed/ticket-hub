USE TicketDB;

-- Categories ----------------------------------------------------------------------------------------------------------
INSERT INTO categories (name) VALUES
    ('Cinema'),
    ('Concert'),
    ('Theatre');

-- Locations -----------------------------------------------------------------------------------------------------------
INSERT INTO locations (name, city, address) VALUES
    ('Filmstaden Malmo',       'Malmo',      'Sodra Forstadsgatan 2'),
    ('Malmo Live',             'Malmo',      'Dag Hammarskjolds torg 4'),
    ('Malmo Opera',            'Malmo',      'Ostra Ronneholmsvagen 20'),
    ('Filmstaden Scandinavia', 'Gothenburg', 'Skansgatan 2'),
    ('Dramaten',               'Stockholm',  'Nybroplan'),
    ('Avicii Arena',           'Stockholm',  'Globentorget 2');

-- Events --------------------------------------------------------------------------------------------------------------
INSERT INTO events (category_id, location_id, title, starts_at, price) VALUES
    -- Cinema (category_id = 1)
    (1, 1, 'Dune: Part Two',           '2026-12-01 18:00:00', 120.00),
    (1, 1, 'Dune: Part Two',           '2026-12-01 21:00:00', 120.00),
    (1, 1, 'Oppenheimer',              '2026-12-01 19:00:00', 110.00),
    (1, 1, 'The Batman',               '2026-12-02 20:00:00', 110.00),
    (1, 4, 'Inside Out 2',             '2026-12-02 16:00:00',  95.00),
    (1, 4, 'Dune: Part Two',           '2026-12-03 19:30:00', 120.00),
    -- Concerts (category_id = 2)
    (2, 6, 'Coldplay Live',            '2026-12-10 20:00:00', 850.00),
    (2, 2, 'Symphony Night',           '2026-12-05 19:00:00', 350.00),
    (2, 2, 'Jazz Evening',             '2026-12-06 20:00:00', 300.00),
    -- Theatre (category_id = 3)
    (3, 5, 'Hamlet',                   '2026-12-08 19:00:00', 450.00),
    (3, 3, 'The Phantom of the Opera', '2026-12-12 19:00:00', 600.00),
    (3, 5, 'A Midsummer Nights Dream', '2026-12-15 18:30:00', 400.00);

-- Users ---------------------------------------------------------------------------------------------------------------
INSERT INTO users (full_name, email) VALUES
    ('Anna Lindqvist',   'anna.lindqvist@example.com'),
    ('Erik Johansson',   'erik.johansson@example.com'),
    ('Maria Svensson',   'maria.svensson@example.com'),
    ('Johan Nilsson',    'johan.nilsson@example.com'),
    ('Sofia Andersson',  'sofia.andersson@example.com'),
    ('Lars Karlsson',    'lars.karlsson@example.com'),
    ('Emma Larsson',     'emma.larsson@example.com'),
    ('Oscar Berg',       'oscar.berg@example.com'),
    ('Alice Holm',       'alice.holm@example.com'),
    ('Viktor Ek',        'viktor.ek@example.com');

-- Tickets -------------------------------------------------------------------------------------------------------------
INSERT INTO tickets (user_id, event_id, seat_label, price) VALUES
    -- Event 1 (Dune: Part Two)
    (1,  1, 'A1', 120.00),
    (1,  1, 'A2', 120.00),
    (2,  1, 'B3', 120.00),
    -- Event 2 (Dune: Part Two)
    (3,  2, 'A5', 120.00),
    (4,  2, 'B1', 120.00),
    -- Event 3 (Oppenheimer)
    (5,  3, 'A2', 110.00),
    (6,  3, 'A3', 110.00),
    -- Event 4 (The Batman)
    (7,  4, 'C5', 110.00),
    -- Event 5 (Inside Out 2)
    (8,  5, 'B5',  95.00),
    (8,  5, 'C1',  95.00),
    (9,  5, 'C2',  95.00),
    -- Event 7 (Coldplay Live)
    (1,  7, 'A5', 850.00),
    (2,  7, 'B1', 850.00),
    (10, 7, 'C5', 850.00),
    -- Event 8 (Symphony Night)
    (3,  8, 'A5', 350.00),
    (4,  8, 'B1', 350.00),
    -- Event 10 (Hamlet)
    (5, 10, 'A5', 450.00),
    (6, 10, 'B1', 450.00),
    (7, 10, 'C2', 450.00),
    -- Event 11 (The Phantom of the Opera)
    (9, 11, 'A5', 600.00),
    (10,11, 'B1', 600.00);