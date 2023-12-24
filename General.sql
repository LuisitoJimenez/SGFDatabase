ALTER TABLE players
    ADD COLUMN player_number INT UNSIGNED NULL;
ALTER TABLE teams
    ADD COLUMN gender_category VARCHAR(50) NOT NULL;
ALTER TABLE teams
    ADD COLUMN age_category VARCHAR(50) NOT NULL;
ALTER TABLE ages
    ADD COLUMN min_age INT UNSIGNED NOT NULL;
ALTER TABLE ages
    ADD COLUMN max_age INT UNSIGNED NOT NULL;
ALTER TABLE roles
    ADD COLUMN description VARCHAR(255) NOT NULL;
ALTER TABLE players
    DROP COLUMN player_number;
ALTER TABLE teams
    DROP COLUMN gender_category;
ALTER TABLE teams
    DROP COLUMN age_category;
ALTER TABLE games
    DROP COLUMN gender_category;
ALTER TABLE games
    DROP COLUMN age_category;
ALTER TABLE tournaments
    DROP COLUMN gender_category;
ALTER TABLE tournaments
    DROP COLUMN age_category;
ALTER TABLE games RENAME COLUMN play_date TO play_date;
ALTER TABLE gender RENAME TO genders;
ALTER TABLE age RENAME TO ages;
ALTER TABLE users
    DROP COLUMN gender;

ALTER TABLE users
    ADD COLUMN address VARCHAR(255) NULL;

UPDATE teams
SET teams.gender_category = "Femenil"
WHERE id = 16;
UPDATE teams
SET teams.gender_category = "Varonil"
WHERE id = 15;
UPDATE teams
SET teams.age_category = "Benjamine"
WHERE id = 16;
UPDATE teams
SET teams.age_category = "Alevine"
WHERE id = 14;
UPDATE users
SET deleted = null;
UPDATE users
SET gender = "Masculino"
WHERE gender = "Hombre";
UPDATE users
SET gender = "Femenino"
WHERE gender = "Mujer";
UPDATE players
SET player_number = 1
WHERE id = 1;
UPDATE players
SET player_number = null
WHERE id = 1;

DELETE
FROM users
WHERE id = 9;
DELETE
FROM games_teams;

DROP TABLE users;
DROP TABLE users_genders;

SELECT *
FROM ages;
SELECT *
FROM players;
SELECT *
FROM games;
SELECT *
FROM roles;
SELECT *
FROM teams;
SELECT *
FROM tournaments;
SELECT *
FROM games_teams;
SELECT *
FROM users_players;
SELECT *
FROM users;

SELECT *
FROM genders;

SELECT game.id,
       game.name,
       game.play_date,
       game.referee,
       team.id   AS teamId,
       team.name AS teamName,
       team.coach
FROM games game
         LEFT JOIN games_teams gameTeam ON game.id = gameTeam.game_id
         LEFT JOIN teams team ON gameTeam.team_id = team.id
WHERE game.id = :pGameId
  AND gameTeam.deleted IS NULL;

SELECT user.id,
       user.name,
       user.birthday,
       user.gender,
       player.player_number AS playerNumber,
       player.photo,
       player.identification
FROM users user
         LEFT JOIN users_players userPlayer ON user.id = userPlayer.user_id
         LEFT JOIN players player ON userPlayer.player_id = player.id
WHERE player.id = :pPlayer
  AND userPlayer.deleted IS NULL;

SELECT user.id,
       user.name,
       user.birthday,
       user.email,
       gender.name
FROM users user
         LEFT JOIN users_genders userGender ON user.id = userGender.user_id
         LEFT JOIN genders gender ON userGender.gender_id = gender.id
WHERE userGender.deleted IS NULL;

SELECT user.id,
       user.name,
       user.birthday,
       user.address,
       gender.name             gender,
       player.player_number AS playerNumber,
       player.photo,
       player.identification
FROM users user
         LEFT JOIN users_genders userGender ON user.id = userGender.user_id
         LEFT JOIN genders gender ON userGender.user_id = user.id
         LEFT JOIN users_players userPlayer ON user.id = userPlayer.user_id
         LEFT JOIN players player ON userPlayer.player_id = player.id
WHERE userPlayer.deleted IS NULL
ORDER BY user.id ASC;

SELECT user.id,
       user.name,
       user.birthday,
       user.email,
       user.address,
       gender.name AS gender
FROM users user
         LEFT JOIN users_genders userGender ON user.id = userGender.user_id
         LEFT JOIN genders gender ON userGender.gender_id = gender.id
WHERE userGender.deleted IS NULL
  AND user.deleted IS NULL;

SELECT user.id,
       user.address,
       user.birthday,
       user.created,
       user.deleted,
       user.email,
       user.external_id,
       user.name,
       user.user_created,
       user.user_deleted
FROM users user
WHERE user.email = ?
  AND user.deleted IS NULL;

SELECT CASE WHEN COUNT(user.email) > 0 THEN 'false' ELSE 'true' END AS available
FROM users user
WHERE user.email = :pEmail
  AND user.deleted IS NULL;

SELECT user.id,
       user.name,
       user.birthday,
       user.email,
       user.address,
       gender.name AS gender
FROM users user
         LEFT JOIN users_genders userGender ON user.id = userGender.user_id
         LEFT JOIN genders gender ON userGender.gender_id = gender.id
WHERE user.id = :pUserId
  AND userGender.deleted IS NULL
  AND user.deleted IS NULL;

SELECT user.id,
       user.name,
       user.birthday,
       gender.name             gender,
       player.player_number AS playerNumber,
       player.photo,
       player.identification
FROM users user
         INNER JOIN users_genders userGender ON user.id = userGender.user_id
         INNER JOIN genders gender ON userGender.user_id = user.id
         INNER JOIN users_players userPlayer ON user.id = userPlayer.user_id
         INNER JOIN players player ON userPlayer.player_id = player.id
WHERE userPlayer.deleted IS NULL
ORDER BY user.id ASC;

SELECT user.id,
       user.name,
       user.birthday,
       gender.name             gender,
       player.player_number AS playerNumber,
       player.photo,
       player.identification
FROM users user
         INNER JOIN users_genders userGender ON user.id = userGender.user_id
         INNER JOIN genders gender ON userGender.gender_id = gender.id
         INNER JOIN users_players userPlayer ON user.id = userPlayer.user_id
         INNER JOIN players player ON userPlayer.player_id = player.id
WHERE user.deleted IS NULL
  AND userPlayer.deleted IS NULL
  AND userGender.deleted IS NULL;

SELECT user.id,
       user.name,
       user.birthday,
       gender.name          AS gender,
       player.player_number AS playerNumber,
       player.photo,
       player.identification
FROM users user
         INNER JOIN users_genders userGender ON user.id = userGender.user_id AND userGender.deleted IS NULL
         INNER JOIN genders gender ON userGender.gender_id = gender.id
         INNER JOIN users_players userPlayer ON user.id = userPlayer.user_id AND userPlayer.deleted IS NULL
         INNER JOIN players player ON userPlayer.player_id = player.id
WHERE user.deleted IS NULL;

SELECT player.id   AS playerId,
       user.name,
       user.birthday,
       gender.name AS gender,
       player.photo,
       player.identification,
       player.player_number
FROM players player
         INNER JOIN users_players userPlayer ON player.id = userPlayer.player_id AND userPlayer.deleted IS NULL
         INNER JOIN users user ON userPlayer.user_id = user.id AND user.deleted IS NULL
         INNER JOIN users_genders userGender ON user.id = userGender.user_id AND userGender.deleted IS NULL
         INNER JOIN genders gender ON userGender.gender_id = gender.id AND gender.deleted IS NULL
WHERE player.deleted IS NULL
  AND player.id = :pPlayerId;


SELECT user.id              AS userId,
       player.id            AS playerId,
       user.name,
       user.birthday,
       gender.name          AS gender,
       player.player_number AS playerNumber,
       player.photo,
       player.identification
FROM users user
         INNER JOIN users_genders userGender ON user.id = userGender.user_id AND userGender.deleted IS NULL
         INNER JOIN genders gender ON userGender.gender_id = gender.id
         INNER JOIN users_players userPlayer ON user.id = userPlayer.user_id AND userPlayer.deleted IS NULL
         INNER JOIN players player ON userPlayer.player_id = player.id
WHERE user.deleted IS NULL;

SELECT *
FROM ages;
SELECT *
FROM teams;

SELECT team.id,
       team.name,
       team.coach,
       gender.name AS gender,
       age.name    AS age
FROM teams team
         LEFT JOIN teams_genders teamGender ON team.id = teamGender.team_id AND teamGender.deleted IS NULL
         LEFT JOIN genders gender ON teamGender.gender_id = gender.id
         LEFT JOIN teams_ages teamAge ON team.id = teamAge.team_id AND teamAge.deleted IS NULL
         LEFT JOIN ages age ON teamAge.age_id = age.id
WHERE team.deleted IS NULL;


SELECT
       player.id,
       user.name,
       gender.id AS genderId,
       player.photo,
       player.identification,
       player.birthplace,
       player.weight,
       player.height
FROM users user
         INNER JOIN users_players userPlayer ON user.id = userPlayer.user_id AND userPlayer.deleted IS NULL
         INNER JOIN players player ON userPlayer.player_id = player.id
         INNER JOIN players_genders playerGender ON player.id = playerGender.player_id AND playerGender.deleted IS NULL
         INNER JOIN genders gender ON playerGender.gender_id = gender.id
WHERE user.deleted IS NULL;

SELECT * FROM users;


SELECT
                   player.id,
                   user.name,
                   gender.id AS genderId,
                   player.photo,
                   player.identification,
                   player.birthplace,
                   player.birthday,
                   player.weight,
                   player.height
            FROM users user
                     INNER JOIN users_players userPlayer ON user.id = userPlayer.user_id AND userPlayer.deleted IS NULL
                     INNER JOIN players player ON userPlayer.player_id = player.id
                     INNER JOIN players_genders playerGender ON player.id = playerGender.player_id AND playerGender.deleted IS NULL
                     INNER JOIN genders gender ON playerGender.gender_id = gender.id
            WHERE user.deleted IS NULL AND player.id = : pPlayerId;

 SELECT
                   referee.id,
                   user.name,
                   user.id AS userId,
                   gender.id AS genderId,
                   referee.photo,
                   referee.identification,
                   referee.birthplace,
                   referee.birthday,
                   referee.weight,
                   referee.height
            FROM users user
                     INNER JOIN users_referees userReferee ON user.id = userReferee.user_id AND userReferee.deleted IS NULL
                     INNER JOIN referees referee ON userReferee.referee_id = referee.id
                     INNER JOIN referees_genders refereeGender ON referee.id = refereeGender.referee_id AND refereeGender.deleted IS NULL
                     INNER JOIN genders gender ON refereeGender.gender_id = gender.id
            WHERE user.deleted IS NULL AND referee.deleted IS NULL;

SELECT
                            club.id,
                            JSON_UNQUOTE(JSON_EXTRACT(club.logo, '$[0].name')) AS logo,
                            club.name,
                            club.social_networks AS socialNetworks,
                            club.email,
                            club.phone
                     FROM clubs club
                     WHERE club.deleted IS NULL;


-- Consulta para obtener los jugadores titulares de un equipo
SELECT
    player.id AS playerId,
    user.name AS userName,
    team.id AS teamId,
    team.name AS teamName
FROM users user
    INNER JOIN users_players userPlayer ON user.id = userPlayer.user_id AND userPlayer.deleted IS NULL
    INNER JOIN players player ON userPlayer.player_id = player.id
    INNER JOIN teams_players teamPlayer ON player.id = teamPlayer.player_id AND teamPlayer.deleted IS NULL
    INNER JOIN teams team ON teamPlayer.team_id = team.id
WHERE user.deleted IS NULL AND player.deleted IS NULL AND team.id = :pTeamId AND teamPlayer.deleted IS NULL AND teamPlayer.type_player_id = 1;

-- Consulta para obtener el equipo por id, asi como el genero y el sub al que pertenece
SELECT
    team.id AS teamId,
    team.name AS name,
    team.coach AS coach,
    gender.id AS genderId,
    sub.id AS subId,
    club.id AS clubId
FROM teams team
    INNER JOIN teams_subs teamSub ON team.id = teamSub.team_id AND teamSub.deleted IS NULL
    INNER JOIN subs sub ON teamSub.sub_id = sub.id AND sub.deleted IS NULL
    INNER JOIN teams_genders teamGender ON team.id = teamGender.team_id AND teamGender.deleted IS NULL
    INNER JOIN genders gender ON teamGender.gender_id = gender.id
    INNER JOIN clubs_teams clubTeam ON team.id = clubTeam.team_id AND clubTeam.deleted IS NULL
    INNER JOIN clubs club ON clubTeam.club_id = club.id
WHERE team.deleted IS NULL AND team.id = :pTeamId;

-- Consulta para obtener la lista de equipos de un club
SELECT
    team.id AS teamId,
    team.name AS name,
    team.coach AS coach,
    gender.id AS genderId,
    sub.id AS subId,
    club.id AS clubId
FROM teams team
    INNER JOIN teams_subs teamSub ON team.id = teamSub.team_id AND teamSub.deleted IS NULL
    INNER JOIN subs sub ON teamSub.sub_id = sub.id AND sub.deleted IS NULL
    INNER JOIN teams_genders teamGender ON team.id = teamGender.team_id AND teamGender.deleted IS NULL
    INNER JOIN genders gender ON teamGender.gender_id = gender.id
    INNER JOIN clubs_teams clubTeam ON team.id = clubTeam.team_id AND clubTeam.deleted IS NULL
    INNER JOIN clubs club ON clubTeam.club_id = club.id
WHERE team.deleted IS NULL;

SELECT
                team.id,
                team.name,
                team.coach,
                gender.id AS genderId,
                sub.id AS subId,
                club.id AS clubId
            FROM teams team
                INNER JOIN teams_subs teamSub ON team.id = teamSub.team_id AND teamSub.deleted IS NULL
                INNER JOIN subs sub ON teamSub.sub_id = sub.id AND sub.deleted IS NULL
                INNER JOIN teams_genders teamGender ON team.id = teamGender.team_id AND teamGender.deleted IS NULL
                INNER JOIN genders gender ON teamGender.gender_id = gender.id
                INNER JOIN clubs_teams clubTeam ON team.id = clubTeam.team_id AND clubTeam.deleted IS NULL
                INNER JOIN clubs club ON clubTeam.club_id = club.id
            WHERE team.deleted IS NULL AND team.id = :pTeamId


-- Consulta para buscar un equipo por id y que no este eliminado en la tabla club_teams
SELECT
    team.id AS teamId,
    team.name AS name,
    club.id AS clubId,
    club.name AS clubName
FROM teams team
    INNER JOIN clubs_teams clubTeam ON team.id = clubTeam.team_id AND clubTeam.deleted IS NULL
    INNER JOIN clubs club ON clubTeam.club_id = club.id
WHERE team.deleted IS NULL AND team.id = :pTeamId;


