USE sac;

SET time_zone = 'America/Mexico_City';

CREATE TABLE user (
    id INT UNSIGNED AUTO_INCREMENT,
    external_id VARCHAR(50) NOT NULL,
    name LONGTEXT COLLATE utf8mb4_bin NOT NULL
        CHECK (JSON_VALID(name)),
    email VARCHAR (255) NOT NULL
        CHECK (`email` REGEXP '^[a-zA-Z0-9.!#$%&''*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:.[a-zA-Z0-9-]+)*$'),
    phone VARCHAR(15) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    created_by INT UNSIGNED NOT NULL,
    modified_at TIMESTAMP NULL,
    modified_by INT UNSIGNED NULL,
    deleted_at TIMESTAMP NULL,
    deleted_by INT UNSIGNED NULL,
    PRIMARY KEY (id)
);

CREATE TABLE team (
    id INT UNSIGNED AUTO_INCREMENT,
    name LONGTEXT NOT NULL,
    coach LONGTEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    created_by INT UNSIGNED NOT NULL,
    modified_at TIMESTAMP NULL,
    modified_by INT UNSIGNED NULL,
    deleted_at TIMESTAMP NULL,
    deleted_by INT UNSIGNED NULL,
    PRIMARY KEY (id)
);

CREATE TABLE game (
    id INT UNSIGNED AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    game_time TIME NOT NULL,
    game_date DATE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    created_by INT UNSIGNED NOT NULL,
    modified_at TIMESTAMP NULL,
    modified_by INT UNSIGNED NULL,
    deleted_at TIMESTAMP NULL,
    deleted_by INT UNSIGNED NULL,
    PRIMARY KEY(id)
);

CREATE TABLE game_team(
    id INT UNSIGNED AUTO_INCREMENT,
    game_id INT UNSIGNED NOT NULL,
    team_id INT UNSIGNED NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    created_by INT UNSIGNED NOT NULL,
    modified_at TIMESTAMP NULL,
    modified_by INT UNSIGNED NULL,
    deleted_at TIMESTAMP NULL,
    deleted_by INT UNSIGNED NULL,
    PRIMARY KEY(id)
);

CREATE TABLE tournament_game (
    id INT UNSIGNED  AUTO_INCREMENT,
    tournament_id INT UNSIGNED NOT NULL,
    game_id INT UNSIGNED NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    created_by INT UNSIGNED NOT NULL,
    modified_at TIMESTAMP NULL,
    modified_by INT UNSIGNED NULL,
    deleted_at TIMESTAMP NULL,
    deleted_by INT UNSIGNED NULL,
    PRIMARY KEY(id)
);

CREATE TABLE player (
    id INT UNSIGNED AUTO_INCREMENT,
    photo VARCHAR(200),
    identification VARCHAR(50),
    birthday DATE NOT NULL,
    birthplace LONGTEXT COLLATE utf8mb4_bin NOT NULL CHECK (JSON_VALID(birthplace)),
    weight FLOAT UNSIGNED NOT NULL,
    height FLOAT UNSIGNED NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    created_by INT UNSIGNED NOT NULL,
    modified_at TIMESTAMP NULL,
    modified_by INT UNSIGNED NULL,
    deleted_at TIMESTAMP NULL,
    deleted_by INT UNSIGNED NULL,
    PRIMARY KEY(id)
);

CREATE TABLE user_player (
    id INT UNSIGNED AUTO_INCREMENT,
    user_id INT UNSIGNED NOT NULL,
    player_id INT UNSIGNED NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    created_by INT UNSIGNED NOT NULL,
    modified_at TIMESTAMP NULL,
    modified_by INT UNSIGNED NULL,
    deleted_at TIMESTAMP NULL,
    deleted_by INT UNSIGNED NULL,
    PRIMARY KEY(id)
);

CREATE TABLE gender (
    id INT UNSIGNED AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    created_by INT UNSIGNED NOT NULL,
    modified_at TIMESTAMP NULL,
    modified_by INT UNSIGNED NULL,
    deleted_at TIMESTAMP NULL,
    deleted_by INT UNSIGNED NULL,
    PRIMARY KEY(id)
);

CREATE TABLE player_gender (
    id INT UNSIGNED AUTO_INCREMENT,
    player_id INT UNSIGNED NOT NULL,
    gender_id INT UNSIGNED NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    created_by INT UNSIGNED NOT NULL,
    modified_at TIMESTAMP NULL,
    modified_by INT UNSIGNED NULL,
    deleted_at TIMESTAMP NULL,
    deleted_by INT UNSIGNED NULL,
    PRIMARY KEY(id)
);

CREATE TABLE club (
    id INT UNSIGNED AUTO_INCREMENT,
    logo LONGTEXT,
    name VARCHAR(50) NOT NULL,
    social_networks LONGTEXT COLLATE utf8mb4_bin
        CHECK (JSON_VALID(social_networks)),
    phone VARCHAR(15) NOT NULL,
    email VARCHAR(255) NOT NULL
        CHECK (`email` REGEXP '^[a-zA-Z0-9.!#$%&''*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:.[a-zA-Z0-9-]+)*$'),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    created_by INT UNSIGNED NOT NULL,
    modified_at TIMESTAMP NULL,
    modified_by INT UNSIGNED NULL,
    deleted_at TIMESTAMP NULL,
    deleted_by INT UNSIGNED NULL,
    PRIMARY KEY (id)
);

CREATE TABLE referees (
    id INT UNSIGNED AUTO_INCREMENT,
    photo VARCHAR(200),
    identification VARCHAR(50),
    birthday DATE NOT NULL,
    birthplace LONGTEXT COLLATE utf8mb4_bin NOT NULL CHECK (JSON_VALID(birthplace)),
    weight FLOAT UNSIGNED NOT NULL,
    height FLOAT UNSIGNED NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    created_by INT UNSIGNED NOT NULL,
    modified_at TIMESTAMP NULL,
    modified_by INT UNSIGNED NULL,
    deleted_at TIMESTAMP NULL,
    deleted_by INT UNSIGNED NULL,
    PRIMARY KEY(id)
);

CREATE TABLE referees_genders (
    id INT UNSIGNED AUTO_INCREMENT,
    referee_id INT UNSIGNED NOT NULL,
    gender_id INT UNSIGNED NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    created_by INT UNSIGNED NOT NULL,
    modified_at TIMESTAMP NULL,
    modified_by INT UNSIGNED NULL,
    deleted_at TIMESTAMP NULL,
    deleted_by INT UNSIGNED NULL,
    PRIMARY KEY(id)
);

CREATE TABLE user_referee (
    id INT UNSIGNED AUTO_INCREMENT,
    user_id INT UNSIGNED NOT NULL,
    referee_id INT UNSIGNED NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    created_by INT UNSIGNED NOT NULL,
    modified_at TIMESTAMP NULL,
    modified_by INT UNSIGNED NULL,
    deleted_at TIMESTAMP NULL,
    deleted_by INT UNSIGNED NULL,
    PRIMARY KEY(id)
);

CREATE TABLE club_team (
    id INT UNSIGNED AUTO_INCREMENT,
    club_id INT UNSIGNED NOT NULL,
    team_id INT UNSIGNED NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    created_by INT UNSIGNED NOT NULL,
    modified_at TIMESTAMP NULL,
    modified_by INT UNSIGNED NULL,
    deleted_at TIMESTAMP NULL,
    deleted_by INT UNSIGNED NULL,
    PRIMARY KEY (id)
);

CREATE TABLE team_player (
    id INT UNSIGNED AUTO_INCREMENT,
    team_id INT UNSIGNED NOT NULL,
    player_id INT UNSIGNED NOT NULL,
    position_id INT UNSIGNED,
    type_player_id INT UNSIGNED NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    created_by INT UNSIGNED NOT NULL,
    modified_at TIMESTAMP NULL,
    modified_by INT UNSIGNED NULL,
    deleted_at TIMESTAMP NULL,
    deleted_by INT UNSIGNED NULL,
    PRIMARY KEY (id)
);

CREATE TABLE sub (
    id INT UNSIGNED AUTO_INCREMENT,
    name VARCHAR(50)  NOT NULL,
    min_age  INT UNSIGNED NOT NULL,
    max_age  INT UNSIGNED NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    created_by INT UNSIGNED NOT NULL,
    modified_at TIMESTAMP NULL,
    modified_by INT UNSIGNED NULL,
    deleted_at TIMESTAMP NULL,
    deleted_by INT UNSIGNED NULL,
    PRIMARY KEY (id)
);

CREATE TABLE type_player (
    id INT UNSIGNED AUTO_INCREMENT,
    name VARCHAR(50)  NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    created_by INT UNSIGNED NOT NULL,
    modified_at TIMESTAMP NULL,
    modified_by INT UNSIGNED NULL,
    deleted_at TIMESTAMP NULL,
    deleted_by INT UNSIGNED NULL,
    PRIMARY KEY (id)
);

CREATE TABLE team_gender (
    id INT UNSIGNED AUTO_INCREMENT,
    team_id INT UNSIGNED NOT NULL,
    gender_id INT UNSIGNED NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    created_by INT UNSIGNED NOT NULL,
    modified_at TIMESTAMP NULL,
    modified_by INT UNSIGNED NULL,
    deleted_at TIMESTAMP NULL,
    deleted_by INT UNSIGNED NULL,
    PRIMARY KEY (id)
);

CREATE TABLE team_sub (
    id INT UNSIGNED AUTO_INCREMENT,
    team_id INT UNSIGNED NOT NULL,
    sub_id INT UNSIGNED NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    created_by INT UNSIGNED NOT NULL,
    modified_at TIMESTAMP NULL,
    modified_by INT UNSIGNED NULL,
    deleted_at TIMESTAMP NULL,
    deleted_by INT UNSIGNED NULL,
    PRIMARY KEY (id)
);

CREATE TABLE game_gender (
    id INT UNSIGNED AUTO_INCREMENT,
    game_id INT UNSIGNED NOT NULL,
    gender_id INT UNSIGNED NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    created_by INT UNSIGNED NOT NULL,
    modified_at TIMESTAMP NULL,
    modified_by INT UNSIGNED NULL,
    deleted_at TIMESTAMP NULL,
    deleted_by INT UNSIGNED NULL,
    PRIMARY KEY (id)
);

CREATE TABLE game_sub (
    id INT UNSIGNED AUTO_INCREMENT,
    game_id INT UNSIGNED NOT NULL,
    sub_id INT UNSIGNED NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    created_by INT UNSIGNED NOT NULL,
    modified_at TIMESTAMP NULL,
    modified_by INT UNSIGNED NULL,
    deleted_at TIMESTAMP NULL,
    deleted_by INT UNSIGNED NULL,
    PRIMARY KEY (id)
);

CREATE TABLE game_referee (
    id INT UNSIGNED AUTO_INCREMENT,
    game_id INT UNSIGNED NOT NULL,
    referee_id INT UNSIGNED NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    created_by INT UNSIGNED NOT NULL,
    modified_at TIMESTAMP NULL,
    modified_by INT UNSIGNED NULL,
    deleted_at TIMESTAMP NULL,
    deleted_by INT UNSIGNED NULL,
    PRIMARY KEY (id)
);

CREATE TABLE tournament (
    id INT UNSIGNED AUTO_INCREMENT,
    logo VARCHAR (200),
    name VARCHAR (50) NOT NULL,
    description VARCHAR (255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    created_by INT UNSIGNED NOT NULL,
    modified_at TIMESTAMP NULL,
    modified_by INT UNSIGNED NULL,
    deleted_at TIMESTAMP NULL,
    deleted_by INT UNSIGNED NULL,
    PRIMARY KEY (id)
);

CREATE TABLE tournament_matchday (
    id INT UNSIGNED AUTO_INCREMENT,
    tournament_id INT UNSIGNED NOT NULL,
    matchday_id INT UNSIGNED NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    created_by INT UNSIGNED NOT NULL,
    modified_at TIMESTAMP NULL,
    modified_by INT UNSIGNED NULL,
    deleted_at TIMESTAMP NULL,
    deleted_by INT UNSIGNED NULL,
    PRIMARY KEY (id)
);

CREATE TABLE matchday (
    id INT UNSIGNED AUTO_INCREMENT,
    name VARCHAR (50) NOT NULL,
    description VARCHAR (255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    created_by INT UNSIGNED NOT NULL,
    modified_at TIMESTAMP NULL,
    modified_by INT UNSIGNED NULL,
    deleted_at TIMESTAMP NULL,
    deleted_by INT UNSIGNED NULL,
    PRIMARY KEY (id)
);

CREATE TABLE matchday_game (
    id INT UNSIGNED AUTO_INCREMENT,
    matchday_id INT UNSIGNED NOT NULL,
    game_id INT UNSIGNED NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    created_by INT UNSIGNED NOT NULL,
    modified_at TIMESTAMP NULL,
    modified_by INT UNSIGNED NULL,
    deleted_at TIMESTAMP NULL,
    deleted_by INT UNSIGNED NULL,
    PRIMARY KEY (id)
);

CREATE TABLE team_statistic (
    id INT UNSIGNED AUTO_INCREMENT,
    team_id INT UNSIGNED NOT NULL,
    statistic_id INT UNSIGNED NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    created_by INT UNSIGNED NOT NULL,
    modified_at TIMESTAMP NULL,
    modified_by INT UNSIGNED NULL,
    deleted_at TIMESTAMP NULL,
    deleted_by INT UNSIGNED NULL,
    PRIMARY KEY (id)
);

CREATE TABLE statistic (
    id INT UNSIGNED AUTO_INCREMENT,
    red_cards INT UNSIGNED,
    yellow_cards INT UNSIGNED,
    goals INT UNSIGNED,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    created_by INT UNSIGNED NOT NULL,
    modified_at TIMESTAMP NULL,
    modified_by INT UNSIGNED NULL,
    deleted_at TIMESTAMP NULL,
    deleted_by INT UNSIGNED NULL,
    PRIMARY KEY (id)
);

CREATE TABLE field (
    id INT UNSIGNED AUTO_INCREMENT,
    logo VARCHAR (200),
    name VARCHAR (50) NOT NULL,
    phone VARCHAR (20) NOT NULL,
    email VARCHAR (50) NOT NULL
        CHECK (`email` REGEXP '^[a-zA-Z0-9.!#$%&''*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:.[a-zA-Z0-9-]+)*$'),
    address LONGTEXT COLLATE utf8mb4_bin NOT NULL CHECK (JSON_VALID(address)),
    capacity INT UNSIGNED NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    created_by INT UNSIGNED NOT NULL,
    modified_at TIMESTAMP NULL,
    modified_by INT UNSIGNED NULL,
    deleted_at TIMESTAMP NULL,
    deleted_by INT UNSIGNED NULL,
    PRIMARY KEY (id)
);

CREATE TABLE field_game (
    id INT UNSIGNED AUTO_INCREMENT,
    field_id INT UNSIGNED NOT NULL,
    game_id INT UNSIGNED NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    created_by INT UNSIGNED NOT NULL,
    modified_at TIMESTAMP NULL,
    modified_by INT UNSIGNED NULL,
    deleted_at TIMESTAMP NULL,
    deleted_by INT UNSIGNED NULL,
    PRIMARY KEY (id)
);

CREATE TABLE tournament_sub (
    id INT UNSIGNED AUTO_INCREMENT,
    tournament_id INT UNSIGNED NOT NULL,
    sub_id INT UNSIGNED NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    created_by INT UNSIGNED NOT NULL,
    modified_at TIMESTAMP NULL,
    modified_by INT UNSIGNED NULL,
    deleted_at TIMESTAMP NULL,
    deleted_by INT UNSIGNED NULL,
    PRIMARY KEY (id)
);

CREATE TABLE tournament_gender(
    id INT UNSIGNED AUTO_INCREMENT,
    tournament_id INT UNSIGNED NOT NULL,
    gender_id INT UNSIGNED NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    created_by INT UNSIGNED NOT NULL,
    modified_at TIMESTAMP NULL,
    modified_by INT UNSIGNED NULL,
    deleted_at TIMESTAMP NULL,
    deleted_by INT UNSIGNED NULL,
    PRIMARY KEY (id)
);

CREATE TABLE game_team_statistic (
    id INT UNSIGNED AUTO_INCREMENT,
    game_id INT UNSIGNED NOT NULL,
    team_statistic_id INT UNSIGNED NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    created_by INT UNSIGNED NOT NULL,
    modified_at TIMESTAMP NULL,
    modified_by INT UNSIGNED NULL,
    deleted_at TIMESTAMP NULL,
    deleted_by INT UNSIGNED NULL,
    PRIMARY KEY (id)
);