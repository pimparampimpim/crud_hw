-- Заполнение данных для гидов
INSERT INTO museum_data.guide (first_name, last_name, birthday) VALUES
('Ivan', 'Petrov', '1978-06-15'),
('Maria', 'Ivanova', '1982-09-23'),
('Alexander', 'Sidorov', '1990-12-01');

-- Заполнение данных для музеев
INSERT INTO museum_data.museum (title, adress, rating) VALUES
('Hermitage', 'Saint Petersburg, Palace Square, 2', 9.5),
('Tretyakov Gallery', 'Moscow, Lavrushinsky Ln, 10', 9.3),
('Russian Museum', 'Saint Petersburg, Inzhenernaya St, 4', 9.0);

-- Заполнение данных для экспонатов
INSERT INTO museum_data.exhibit (museum_id, title, info, era) VALUES
((SELECT id FROM museum_data.museum WHERE title = 'Hermitage'), 'Peacock Clock', 'An 18th-century automated clock', '1790-01-01'),
((SELECT id FROM museum_data.museum WHERE title = 'Tretyakov Gallery'), 'Theotokos of Vladimir', 'Icon of the Virgin Mary', '1400-01-01'),
((SELECT id FROM museum_data.museum WHERE title = 'Russian Museum'), 'Portrait of Anna Akhmatova', 'Famous portrait of the Russian poet', '1922-01-01');

-- Связь между музеями и экспонатами
INSERT INTO museum_data.museum_to_guide (museum_id, exhibit_id) VALUES
((SELECT id FROM museum_data.museum WHERE title = 'Hermitage'), (SELECT id FROM museum_data.exhibit WHERE title = 'Peacock Clock')),
((SELECT id FROM museum_data.museum WHERE title = 'Tretyakov Gallery'), (SELECT id FROM museum_data.exhibit WHERE title = 'Theotokos of Vladimir')),
((SELECT id FROM museum_data.museum WHERE title = 'Russian Museum'), (SELECT id FROM museum_data.exhibit WHERE title = 'Portrait of Anna Akhmatova'));