-- --- FISH TYPES ---
INSERT INTO fish_types (name) VALUES
('Cod'),
('Perch'),
('Hake');

-- --- BOATS ---
INSERT INTO boats (name, boat_type, displacement, build_date, color) VALUES
('Sea Hunter', 'Trawler', 1200.5, '2010-05-12', 'Blue'),
('Ocean King', 'Longliner', 980.0, '2015-07-23', 'White'),
('Wave Rider', 'Seiner', 1100.3, '2012-03-18', 'Green');


-- --- TRIPS ---
INSERT INTO trips (boat_id, departure_date, return_date) VALUES
(1, '2025-01-10', '2025-01-20'),
(2, '2025-02-05', '2025-02-18'),
(3, '2025-03-01', NULL);


-- --- CREW MEMBERS ---
INSERT INTO crew_members (name, position, trip_id) VALUES
('Ivan Petrov', 'Captain', 1),
('Sergey Ivanov', 'Navigator', 2),
('Alexey Smirnov', 'Engineer', 3);


-- --- FISH CATCHES ---
INSERT INTO fish_catches (trip_id, fish_type_id, weight) VALUES
(1, 1, 500.5),
(2, 2, 300.0),
(3, 3, 450.75);


-- --- BANK VISITS ---
INSERT INTO bank_visits (trip_id, bank_name, arrival_date, departure_date, fish_quality) VALUES
(1, 'North Bank', '2025-01-12', '2025-01-15', 'good'),
(2, 'Atlantic Spot', '2025-02-07', '2025-02-10', 'excellent'),
(3, 'Deep Sea Zone', '2025-03-03', '2025-03-06', 'poor');