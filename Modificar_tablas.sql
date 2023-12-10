USE sac;

SELECT * FROM games;

ALTER TABLE games ADD COLUMN age_category VARCHAR(50) NOT NULL;
ALTER TABLE games ADD COLUMN gender_category VARCHAR(50) NOT NULL;

ALTER TABLE players ADD COLUMN birthplace LONGTEXT COLLATE utf8mb4_bin NOT NULL CHECK (JSON_VALID(birthplace));
ALTER TABLE players ADD COLUMN weight FLOAT UNSIGNED NOT NULL;
ALTER TABLE players ADD COLUMN height FLOAT UNSIGNED NOT NULL;
ALTER TABLE players ADD COLUMN nationality VARCHAR(50) NOT NULL;

ALTER TABLE users DROP COLUMN address;
ALTER TABLE users DROP COLUMN birthday;

-- Renombrar una columna
ALTER TABLE players_genders RENAME COLUMN user_id TO player_id;

ALTER TABLE players ADD COLUMN birthdate DATE NOT NULL;

ALTER TABLE players RENAME COLUMN birthdate TO birthday;

ALTER TABLE players DROP COLUMN nationality;

ALTER TABLE players DROP COLUMN player_number;
