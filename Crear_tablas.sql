USE sac;

SET time_zone = 'America/Mexico_City';

CREATE TABLE users (
    id INT UNSIGNED AUTO_INCREMENT,
    external_id VARCHAR(50) NOT NULL,
    name LONGTEXT COLLATE utf8mb4_bin NOT NULL
        CHECK (JSON_VALID(name)),
    email VARCHAR (255) NOT NULL
        CHECK (`email` REGEXP '^[a-zA-Z0-9.!#$%&''*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:.[a-zA-Z0-9-]+)*$'),
    phone VARCHAR(15) NOT NULL,
    active BIT DEFAULT b'1' NOT NULL,
    user_created INT UNSIGNED NOT NULL,
    created TIMESTAMP DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    user_deleted INT UNSIGNED NULL,
    deleted TIMESTAMP NULL,
    PRIMARY KEY (id)
);

CREATE TABLE teams (
    id INT UNSIGNED AUTO_INCREMENT,
    name LONGTEXT NOT NULL,
    coach LONGTEXT NOT NULL,
    user_created INT UNSIGNED NOT NULL,
    created TIMESTAMP DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    user_deleted INT UNSIGNED NULL,
    deleted TIMESTAMP NULL,
    PRIMARY KEY (id)
);

/*CREATE TABLE users_teams (
    id INT UNSIGNED AUTO_INCREMENT,
    user_id INT UNSIGNED NOT NULL,
    team_id INT UNSIGNED NOT NULL,
    user_created INT UNSIGNED NOT NULL,
    created TIMESTAMP DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    user_deleted INT UNSIGNED NULL,
    deleted TIMESTAMP NULL,
    PRIMARY KEY (id),
    UNIQUE KEY (user_id, team_id)
);*/

/*CREATE TABLE roles (
    id INT UNSIGNED AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    description VARCHAR(255) NOT NULL,
    active BIT DEFAULT b'1' NOT NULL,
    user_created INT UNSIGNED NOT NULL,
    created TIMESTAMP DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    user_deleted INT UNSIGNED NULL,
    deleted TIMESTAMP NULL,
    PRIMARY KEY(id)
);*/

/*CREATE TABLE users_teams_roles (
    id INT UNSIGNED AUTO_INCREMENT,
    role_id INT UNSIGNED NOT NULL,
    user_team_id INT UNSIGNED NOT NULL,
    user_created INT UNSIGNED NOT NULL,
    created TIMESTAMP DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    user_deleted INT UNSIGNED NULL,
    deleted TIMESTAMP NULL,
    PRIMARY KEY(id)
);*/

CREATE TABLE games (
    id INT UNSIGNED AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    -- referee LONGTEXT COLLATE utf8mb4_bin NOT NULL
        -- CHECK(JSON_VALID(referee)),
    -- play_date TIMESTAMP NOT NULL,
    game_time TIME NOT NULL,
    game_date DATE NOT NULL,
    field VARCHAR(50),
    user_created INT UNSIGNED NOT NULL,
    created TIMESTAMP DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    user_deleted INT UNSIGNED NULL,
    deleted TIMESTAMP NULL,
    PRIMARY KEY(id)
);

CREATE TABLE games_teams(
    id INT UNSIGNED AUTO_INCREMENT,
    game_id INT UNSIGNED NOT NULL,
    team_id INT UNSIGNED NOT NULL,
    user_created INT UNSIGNED NOT NULL,
    created TIMESTAMP DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    user_deleted INT UNSIGNED NULL,
    deleted TIMESTAMP NULL,
    PRIMARY KEY(id)
);

CREATE TABLE tournaments (
    id INT UNSIGNED AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    start_date TIMESTAMP NOT NULL,
    end_date TIMESTAMP NOT NULL,
    user_created INT UNSIGNED NOT NULL,
    created TIMESTAMP DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    user_deleted INT UNSIGNED NULL,
    deleted TIMESTAMP NULL,
    PRIMARY KEY(id)
);

CREATE TABLE tournaments_games (
    id INT UNSIGNED  AUTO_INCREMENT,
    tournament_id INT UNSIGNED NOT NULL,
    game_id INT UNSIGNED NOT NULL,
    user_created INT UNSIGNED NOT NULL,
    created TIMESTAMP DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    user_deleted INT UNSIGNED NULL,
    deleted TIMESTAMP NULL,
    PRIMARY KEY(id)
);

CREATE TABLE statistics (
    id INT UNSIGNED AUTO_INCREMENT,
    goals INT UNSIGNED NOT NULL,
    yellow_cards INT UNSIGNED NOT NULL,
    red_cards INT UNSIGNED NOT NULL,
    penalties INT UNSIGNED NOT NULL,
    name_game VARCHAR(50),
    user_created INT UNSIGNED NOT NULL,
    created TIMESTAMP DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    user_deleted INT UNSIGNED NULL,
    deleted TIMESTAMP NULL,
    PRIMARY KEY(id)
);

CREATE TABLE statistics_games (
    id INT UNSIGNED AUTO_INCREMENT,
    game_id INT UNSIGNED NOT NULL,
    statistic_id INT UNSIGNED NOT NULL,
    user_created INT UNSIGNED NOT NULL,
    created TIMESTAMP DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    user_deleted INT UNSIGNED NULL,
    deleted TIMESTAMP NULL,
    PRIMARY KEY(id)
);

CREATE TABLE players (
    id INT UNSIGNED AUTO_INCREMENT,
    photo VARCHAR(200),
    identification VARCHAR(50),
    birthday DATE NOT NULL,
    birthplace LONGTEXT COLLATE utf8mb4_bin NOT NULL CHECK (JSON_VALID(birthplace)),
    weight FLOAT UNSIGNED NOT NULL,
    height FLOAT UNSIGNED NOT NULL,
    user_created INT UNSIGNED NOT NULL,
    created TIMESTAMP DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    user_deleted INT UNSIGNED NULL,
    deleted TIMESTAMP NULL,
    PRIMARY KEY(id)
);

CREATE TABLE users_players (
    id INT UNSIGNED AUTO_INCREMENT,
    user_id INT UNSIGNED NOT NULL,
    player_id INT UNSIGNED NOT NULL,
    user_created INT UNSIGNED NOT NULL,
    created TIMESTAMP DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    user_deleted INT UNSIGNED NULL,
    deleted TIMESTAMP NULL,
    PRIMARY KEY(id)
);

/*CREATE TABLE ages (
    id INT UNSIGNED AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    active BIT DEFAULT b'1' NOT NULL,
    min_age INT UNSIGNED NOT NULL,
    max_age INT UNSIGNED NOT NULL,
    user_created INT UNSIGNED NOT NULL,
    created TIMESTAMP DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    user_deleted INT UNSIGNED NULL,
    deleted TIMESTAMP NULL,
    PRIMARY KEY(id)
);*/

CREATE TABLE genders (
    id INT UNSIGNED AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    active BIT DEFAULT b'1' NOT NULL,
    user_created INT UNSIGNED NOT NULL,
    created TIMESTAMP DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    user_deleted INT UNSIGNED NULL,
    deleted TIMESTAMP NULL,
    PRIMARY KEY(id)
);

/*CREATE TABLE actions (
    id INT UNSIGNED AUTO_INCREMENT,
    module_id INT UNSIGNED NOT NULL,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(255) NOT NULL,
    active BIT DEFAULT b'1' NOT NULL,
    user_created INT UNSIGNED NOT NULL,
    created TIMESTAMP DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    user_deleted INT UNSIGNED NULL,
    deleted TIMESTAMP NULL,
    PRIMARY KEY(id)
);*/

/*CREATE TABLE roles_actions (
    id INT UNSIGNED AUTO_INCREMENT,
    role_id INT UNSIGNED NOT NULL,
    action_id INT UNSIGNED NOT NULL,
    active BIT DEFAULT b'1' NOT NULL,
    user_created INT UNSIGNED NOT NULL,
    created TIMESTAMP DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    user_deleted INT UNSIGNED NULL,
    deleted TIMESTAMP NULL,
    PRIMARY KEY(id)
);*/

CREATE TABLE players_genders (
    id INT UNSIGNED AUTO_INCREMENT,
    player_id INT UNSIGNED NOT NULL,
    gender_id INT UNSIGNED NOT NULL,
    user_created INT UNSIGNED NOT NULL,
    created TIMESTAMP DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    user_deleted INT UNSIGNED NULL,
    deleted TIMESTAMP NULL,
    PRIMARY KEY(id)
);

/*CREATE TABLE teams_gender (
    id INT UNSIGNED AUTO_INCREMENT,
    team_id INT UNSIGNED NOT NULL,
    gender_id INT UNSIGNED NOT NULL,
    user_created INT UNSIGNED NOT NULL,
    created TIMESTAMP DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    user_deleted INT UNSIGNED NULL,
    deleted TIMESTAMP NULL,
    PRIMARY KEY (id)
);*/

/*CREATE TABLE teams_ages (
    id INT UNSIGNED AUTO_INCREMENT,
    team_id INT UNSIGNED NOT NULL,
    age_id INT UNSIGNED NOT NULL,
    user_created INT UNSIGNED NOT NULL,
    created TIMESTAMP DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    user_deleted INT UNSIGNED NULL,
    deleted TIMESTAMP NULL,
    PRIMARY KEY (id)
);*/

CREATE TABLE clubs (
    id INT UNSIGNED AUTO_INCREMENT,
    logo LONGTEXT,
    name VARCHAR(50) NOT NULL,
    social_networks LONGTEXT COLLATE utf8mb4_bin
        CHECK (JSON_VALID(social_networks)),
    phone VARCHAR(15) NOT NULL,
    email VARCHAR(255) NOT NULL
        CHECK (`email` REGEXP '^[a-zA-Z0-9.!#$%&''*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:.[a-zA-Z0-9-]+)*$'),
    user_created INT UNSIGNED NOT NULL,
    created TIMESTAMP DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    user_deleted INT UNSIGNED NULL,
    deleted TIMESTAMP NULL,
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
    user_created INT UNSIGNED NOT NULL,
    created TIMESTAMP DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    user_deleted INT UNSIGNED NULL,
    deleted TIMESTAMP NULL,
    PRIMARY KEY(id)
);

CREATE TABLE referees_genders (
    id INT UNSIGNED AUTO_INCREMENT,
    referee_id INT UNSIGNED NOT NULL,
    gender_id INT UNSIGNED NOT NULL,
    user_created INT UNSIGNED NOT NULL,
    created TIMESTAMP DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    user_deleted INT UNSIGNED NULL,
    deleted TIMESTAMP NULL,
    PRIMARY KEY(id)
);

CREATE TABLE users_referees (
    id INT UNSIGNED AUTO_INCREMENT,
    user_id INT UNSIGNED NOT NULL,
    referee_id INT UNSIGNED NOT NULL,
    user_created INT UNSIGNED NOT NULL,
    created TIMESTAMP DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    user_deleted INT UNSIGNED NULL,
    deleted TIMESTAMP NULL,
    PRIMARY KEY(id)
);

/*CREATE TABLE team_titular_players(
    id INT UNSIGNED AUTO_INCREMENT,
    team_id INT UNSIGNED NOT NULL,
    player_id INT UNSIGNED NOT NULL,
    position_id INT UNSIGNED NOT NULL,
    user_created INT UNSIGNED NOT NULL,
    created TIMESTAMP DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    user_deleted INT UNSIGNED NULL,
    deleted TIMESTAMP NULL,
    PRIMARY KEY (id)
);*/

/*CREATE TABLE team_substitute_players(
    id INT UNSIGNED AUTO_INCREMENT,
    team_id INT UNSIGNED NOT NULL,
    player_id INT UNSIGNED NOT NULL,
    position_id INT UNSIGNED NOT NULL,
    user_created INT UNSIGNED NOT NULL,
    created TIMESTAMP DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    user_deleted INT UNSIGNED NULL,
    deleted TIMESTAMP NULL,
    PRIMARY KEY (id)
);*/

CREATE TABLE clubs_teams (
    id INT UNSIGNED AUTO_INCREMENT,
    club_id INT UNSIGNED NOT NULL,
    team_id INT UNSIGNED NOT NULL,
    user_created INT UNSIGNED NOT NULL,
    created TIMESTAMP DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    user_deleted INT UNSIGNED NULL,
    deleted TIMESTAMP NULL,
    PRIMARY KEY (id)
);

CREATE TABLE teams_players (
    id INT UNSIGNED AUTO_INCREMENT,
    team_id INT UNSIGNED NOT NULL,
    player_id INT UNSIGNED NOT NULL,
    position_id INT UNSIGNED,
    type_player_id INT UNSIGNED NOT NULL,
    user_created INT UNSIGNED NOT NULL,
    created TIMESTAMP DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    user_deleted INT UNSIGNED NULL,
    deleted TIMESTAMP NULL,
    PRIMARY KEY (id)
);

CREATE TABLE subs (
    id INT UNSIGNED AUTO_INCREMENT,
    name VARCHAR(50)  NOT NULL,
    min_age  INT UNSIGNED NOT NULL,
    max_age  INT UNSIGNED NOT NULL,
    user_created INT UNSIGNED NOT NULL,
    created TIMESTAMP DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    user_deleted INT UNSIGNED NULL,
    deleted TIMESTAMP NULL,
    PRIMARY KEY (id)
);

CREATE TABLE type_player (
    id INT UNSIGNED AUTO_INCREMENT,
    name VARCHAR(50)  NOT NULL,
    user_created INT UNSIGNED NOT NULL,
    created TIMESTAMP DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    user_deleted INT UNSIGNED NULL,
    deleted TIMESTAMP NULL,
    PRIMARY KEY (id)
);

CREATE TABLE teams_genders (
    id INT UNSIGNED AUTO_INCREMENT,
    team_id INT UNSIGNED NOT NULL,
    gender_id INT UNSIGNED NOT NULL,
    user_created INT UNSIGNED NOT NULL,
    created TIMESTAMP DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    user_deleted INT UNSIGNED NULL,
    deleted TIMESTAMP NULL,
    PRIMARY KEY (id)
);

CREATE TABLE teams_subs (
    id INT UNSIGNED AUTO_INCREMENT,
    team_id INT UNSIGNED NOT NULL,
    sub_id INT UNSIGNED NOT NULL,
     user_created INT UNSIGNED NOT NULL,
    created TIMESTAMP DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    user_deleted INT UNSIGNED NULL,
    deleted TIMESTAMP NULL,
    PRIMARY KEY (id)
);

CREATE TABLE game_gender (
    id INT UNSIGNED AUTO_INCREMENT,
    game_id INT UNSIGNED NOT NULL,
    gender_id INT UNSIGNED NOT NULL,
    user_created INT UNSIGNED NOT NULL,
    created TIMESTAMP DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    user_deleted INT UNSIGNED NULL,
    deleted TIMESTAMP NULL,
    PRIMARY KEY (id)
);

CREATE TABLE game_sub (
    id INT UNSIGNED AUTO_INCREMENT,
    game_id INT UNSIGNED NOT NULL,
    sub_id INT UNSIGNED NOT NULL,
    user_created INT UNSIGNED NOT NULL,
    created TIMESTAMP DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    user_deleted INT UNSIGNED NULL,
    deleted TIMESTAMP NULL,
    PRIMARY KEY (id)
);