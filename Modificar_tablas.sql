USE sac;

SELECT * FROM game;

ALTER TABLE game ADD COLUMN age_category VARCHAR(50) NOT NULL;
ALTER TABLE game ADD COLUMN gender_category VARCHAR(50) NOT NULL;

ALTER TABLE player ADD COLUMN birthplace LONGTEXT COLLATE utf8mb4_bin NOT NULL CHECK (JSON_VALID(birthplace));
ALTER TABLE player ADD COLUMN weight FLOAT UNSIGNED NOT NULL;
ALTER TABLE player ADD COLUMN height FLOAT UNSIGNED NOT NULL;
ALTER TABLE player ADD COLUMN nationality VARCHAR(50) NOT NULL;

ALTER TABLE field ADD COLUMN email VARCHAR (50) NOT NULL
        CHECK (`email` REGEXP '^[a-zA-Z0-9.!#$%&''*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:.[a-zA-Z0-9-]+)*$');

ALTER TABLE field ADD COLUMN address LONGTEXT COLLATE utf8mb4_bin NOT NULL CHECK (JSON_VALID(address));

ALTER TABLE user DROP COLUMN address;
ALTER TABLE user DROP COLUMN birthday;

-- Renombrar una columna
ALTER TABLE player_gender RENAME COLUMN user_id TO player_id;

ALTER TABLE player ADD COLUMN birthdate DATE NOT NULL;

ALTER TABLE player RENAME COLUMN birthdate TO birthday;

ALTER TABLE player DROP COLUMN nationality;

ALTER TABLE player DROP COLUMN player_number;
