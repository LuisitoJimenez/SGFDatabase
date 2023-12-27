INSERT INTO users (name, email, birthday, gender, user_created)
VALUES
    ('{"first": "Ivan", "last": "Andrade", "middle": "", "secondLast": "Villa"}', 'ivan.andrade@example.com', '1990-01-02', 'Masculino', 1),
    ('{"first": "Arturo", "last": "Austria", "middle": "", "secondLast": "Cornejo"}', 'arturo.austria@example.com', '1985-01-22', 'Masculino', 1),
    ('{"first": "Esmeralda", "last": "De la Rosa", "middle": "", "secondLast": "Felipe"}', 'esmeralda.delarosa@example.com', '1982-01-03', 'Femenino', 1),
    ('{"first": "Jose", "last": "Garcia", "middle": "Rafael", "secondLast": "Ceme"}', 'jose.garcia@example.com', '1989-01-04', 'Masculino', 1),
    ('{"first": "José", "last": "Gutiérrez", "middle": "Ramón", "secondLast": "Zamora"}', 'jose.gutierrez@example.com', '1982-01-10', 'Masculino', 1),
    ('{"first": "Luis", "last": "Jimenez", "middle": "Alberto", "secondLast": "Sanchez"}', 'luis.jimenez@example.com', '1983-01-26', 'Masculino', 1),
    ('{"first": "Francisco", "last": "Meneses", "middle": "Zurisaddai", "secondLast": "Salinas"}', 'francisco.meneses@example.com', '1990-01-16', 'Masculino', 1),
    ('{"first": "Patricia", "last": "Sanchez", "middle": "", "secondLast": "Lopez"}', 'patricia.sanchez@example.com', '1996-01-01', 'Femenino', 1),
    ('{"first": "Eliel", "last": "Vidal", "middle": "", "secondLast": "Cano"}', 'eliel.vidal@example.com', '1980-01-01', 'Masculino', 1);

INSERT INTO teams (name, coach, user_created) VALUES
    ('América', '{"first": "Miguel", "middle": "Ernesto", "last": "Herrera", "secondLast": "Aguirre"}', 1),
    ('Atlas', '{"first": "Diego", "middle": "Martín", "last": "Cocca", "secondLast": "García"}', 1),
    ('Atlético San Luis', '{"first": "Leonel", "middle": "Antonio", "last": "Rocco", "secondLast": "Pérez"}', 1),
    ('Cruz Azul', '{"first": "Juan", "middle": "Reynaldo", "last": "Reynoso", "secondLast": "Guzmán"}', 1),
    ('Guadalajara', '{"first": "Víctor Manuel", "middle": "Enrique", "last": "Vucetich", "secondLast": "Rojas"}', 1),
    ('Juárez', '{"first": "Ricardo", "middle": "Alberto", "last": "Ferretti", "secondLast": "de Oliveira"}', 1),
    ('León', '{"first": "Ariel", "middle": "", "last": "Holan", "secondLast": ""}', 1),
    ('Mazatlán', '{"first": "Beñat", "middle": "", "last": "San José", "secondLast": ""}', 1);

INSERT INTO players (photo, identification, user_created)
VALUES ('/ruta/a/la/foto1.jpg', '/ruta/a/la/identificacion1.jpg', 1),
       ('/ruta/a/la/foto2.jpg', '/ruta/a/la/identificacion2.jpg', 1),
       ('/ruta/a/la/foto3.jpg', '/ruta/a/la/identificacion3.jpg', 1),
       ('/ruta/a/la/foto4.jpg', '/ruta/a/la/identificacion4.jpg', 1),
       ('/ruta/a/la/foto5.jpg', '/ruta/a/la/identificacion5.jpg', 1),
       ('/ruta/a/la/foto6.jpg', '/ruta/a/la/identificacion6.jpg', 1),
       ('/ruta/a/la/foto7.jpg', '/ruta/a/la/identificacion7.jpg', 1),
       ('/ruta/a/la/foto8.jpg', '/ruta/a/la/identificacion8.jpg', 1),
       ('/ruta/a/la/foto9.jpg', '/ruta/a/la/identificacion9.jpg', 1),
       ('/ruta/a/la/foto10.jpg', '/ruta/a/la/identificacion10.jpg', 1);

INSERT INTO games (name, referee, gender_category, age_category, date_time, user_created)
VALUES
('Game 1', '{"first": "Miguel", "middle": "Ernesto", "last": "Herrera", "secondLast": "Aguirre"}', 'Varonil', 'Prebenjamin', '2022-01-01 12:00:00', 1),
('Game 2', '{"first": "Maria", "middle": "Fernanda", "last": "Garcia", "secondLast": "Lopez"}', 'Femenil', 'Benjamine', '2022-01-02 13:00:00', 1),
('Game 3', '{"first": "Juan", "middle": "Carlos", "last": "Perez", "secondLast": "Gonzalez"}', 'Varonil', 'Alevine', '2022-01-03 14:00:00', 1),
('Game 4', '{"first": "Ana", "middle": "Sofia", "last": "Rodriguez", "secondLast": "Martinez"}', 'Femenil', 'Infantil', '2022-01-04 15:00:00', 1),
('Game 5', '{"first": "Luis", "middle": "Alberto", "last": "Juarez", "secondLast": "Sanchez"}', 'Varonil', 'Cadete', '2022-01-05 16:00:00', 1),
('Game 5', '{"first": "Luis", "middle": "Fernando", "last": "Hernandez", "secondLast": "Sanchez"}', 'Varonil', 'Juvenil', '2022-01-05 16:00:00', 1);

INSERT INTO ages (name, min_age, max_age, user_created)
VALUES
    ('Prebenjamines', 5, 8, 1),
    ('Benjamines', 9, 10, 1),
    ('Alevines', 11, 12, 1),
    ('Infantiles', 13, 14, 1),
    ('Cadetes', 15, 16, 1),
    ('Juveniles', 17, 19, 1),
    ('Senior',20, 100, 1);

INSERT INTO genders (name, active, user_created)
VALUES
    ('Masculino', b'1', 1),
    ('Femenino', b'1', 1);

INSERT INTO users (name, email, birthday, gender, user_created)
VALUES
    ('{"first": "Ivan", "last": "Andrade", "middle": "", "secondLast": "Villa"}', 'ivan.andrade@example.com', '1990-01-02', 'Masculino', 1),
    ('{"first": "Arturo", "last": "Austria", "middle": "", "secondLast": "Cornejo"}', 'arturo.austria@example.com', '1985-01-22', 'Masculino', 1),
    ('{"first": "Esmeralda", "last": "De la Rosa", "middle": "", "secondLast": "Felipe"}', 'esmeralda.delarosa@example.com', '1982-01-03', 'Femenino', 1),
    ('{"first": "Jose", "last": "Garcia", "middle": "Rafael", "secondLast": "Ceme"}', 'jose.garcia@example.com', '1989-01-04', 'Masculino', 1),
    ('{"first": "José", "last": "Gutiérrez", "middle": "Ramón", "secondLast": "Zamora"}', 'jose.gutierrez@example.com', '1982-01-10', 'Masculino', 1),
    ('{"first": "Luis", "last": "Jimenez", "middle": "Alberto", "secondLast": "Sanchez"}', 'luis.jimenez@example.com', '1983-01-26', 'Masculino', 1),
    ('{"first": "Francisco", "last": "Meneses", "middle": "Zurisaddai", "secondLast": "Salinas"}', 'francisco.meneses@example.com', '1990-01-16', 'Masculino', 1),
    ('{"first": "Patricia", "last": "Sanchez", "middle": "", "secondLast": "Lopez"}', 'patricia.sanchez@example.com', '1996-01-01', 'Femenino', 1),
    ('{"first": "Eliel", "last": "Vidal", "middle": "", "secondLast": "Cano"}', 'eliel.vidal@example.com', '1980-01-01', 'Masculino', 1);

INSERT INTO users (name, email, birthday, gender, user_created) VALUES ('{"first": "Eliel", "last": "Vidal", "middle": "", "secondLast": "Cano"}', 'eliel.vidal@example.com', '1980-01-01', 'Masculino', 1);

INSERT INTO users_players (user_id, player_id, user_created) VALUES (1, 1, 1);
INSERT INTO users_players (user_id, player_id, user_created) VALUES (2, 2, 1);
INSERT INTO users_players (user_id, player_id, user_created) VALUES (10, 10, 1);
INSERT INTO teams_genders (team_id, gender_id, user_created) VALUES (1, 1, 1);
INSERT INTO teams_genders (team_id, gender_id, user_created) VALUES (2, 2, 1);
INSERT INTO teams_genders (team_id, gender_id, user_created) VALUES (3, 1, 1);
INSERT INTO teams_ages(team_id, age_id, user_created) VALUES (1, 1, 1);
INSERT INTO teams_ages(team_id, age_id, user_created) VALUES (2, 2, 1);
INSERT INTO teams_ages(team_id, age_id, user_created) VALUES (3, 3, 1);

INSERT INTO subs (name, min_age, max_age, user_created)
VALUES
    ('SUB 13', 13, 13, 1),
    ('SUB 14', 14, 14, 1),
    ('SUB 15', 15, 15, 1),
    ('SUB 16', 16, 16, 1),
    ('SUB 17', 17, 17, 1),
    ('SUB 18', 18, 18, 1),
    ('SUB 19',19, 19, 1),
    ('SUB 20', 20, 20, 1),
    ('SUB 21', 21, 21, 1),
    ('SUB 22', 22, 22, 1),
    ('SUB 23', 23, 23, 1),
    ('ADULTOS', 24, 100, 1);

SELECT * FROM games;
SELECT * FROM roles;
SELECT * FROM games;
SELECT * FROM ages;
SELECT * FROM genders;
SELECT * FROM users;
SELECT * FROM players;
SELECT * FROM teams;
SELECT * FROM teams_genders;
SELECT * FROM teams_ages;

UPDATE users SET deleted = null;

INSERT INTO type_player (name, user_created) VALUES ('Titular player', 1), ('Substitute player', 1);

INSERT INTO clubs_teams (club_id, team_id, user_created) VALUES (1, 1, 1);
INSERT INTO teams_subs (team_id, sub_id, user_created) VALUES (1, 10, 1);
INSERT INTO teams_genders (team_id, gender_id, user_created) VALUES (1, 1, 1);

