USE sac;

-- USUARIOS
-- Verficar disponibilidad de email
SELECT CASE WHEN COUNT(u.email) > 0 THEN 'false' ELSE 'true' END AS available
FROM user u
WHERE u.email = :pEmail
  AND u.deleted_at IS NULL;

-- Obtener usuario por id
SELECT id,
       name,
       email,
       phone
FROM user
WHERE id = :pUserId
  AND deleted_at IS NULL;

-- Obtener lista de usuarios
SELECT id,
       name,
       email,
       phone
FROM user
WHERE deleted_at IS NULL;


-- JUGADORES
-- Obtener lista de jugadores
SELECT p.id,
       user.name,
       user.id                                          AS userId,
       g.id                                             AS genderId,
       JSON_UNQUOTE(JSON_EXTRACT(p.photo, '$[0].name')) AS photo,
       p.identification,
       p.birthplace,
       p.birthday,
       p.weight,
       p.height
FROM user user
         INNER JOIN user_player up ON user.id = up.user_id AND up.deleted_at IS NULL
         INNER JOIN player p ON up.player_id = p.id
         INNER JOIN player_gender pg ON p.id = pg.player_id AND pg.deleted_at IS NULL
         INNER JOIN gender g ON pg.gender_id = g.id
WHERE user.deleted_at IS NULL
  AND p.deleted_at IS NULL;

-- Obtener jugador por id
SELECT p.id,
       u.name,
       g.id AS genderId,
       p.photo,
       p.identification,
       p.birthplace,
       p.birthday,
       p.weight,
       p.height
FROM user u
         INNER JOIN user_player up ON u.id = up.user_id AND up.deleted_at IS NULL
         INNER JOIN player p ON up.player_id = p.id
         INNER JOIN player_gender pg ON p.id = pg.player_id AND pg.deleted_at IS NULL
         INNER JOIN gender g ON pg.gender_id = g.id
WHERE u.deleted_at IS NULL
  AND p.id = :pPlayerId;

-- ÁRBITROS

-- Obtener lista de árbitros
SELECT r.id,
       u.name,
       u.id                                             AS userId,
       g.id                                             AS genderId,
       JSON_UNQUOTE(JSON_EXTRACT(r.photo, '$[0].name')) AS photo,
       r.identification,
       r.birthplace,
       r.birthday,
       r.weight,
       r.height
FROM user u
         INNER JOIN user_referee ur ON u.id = ur.user_id AND ur.deleted_at IS NULL
         INNER JOIN referee r ON ur.referee_id = r.id
         INNER JOIN referee_gender rg
                    ON r.id = rg.referee_id AND rg.deleted_at IS NULL
         INNER JOIN gender g ON rg.gender_id = g.id
WHERE u.deleted_at IS NULL
  AND r.deleted_at IS NULL;

-- Obtener árbitro por id
SELECT r.id,
       u.name,
       g.id AS genderId,
       r.photo,
       r.identification,
       r.birthplace,
       r.birthday,
       r.weight,
       r.height
FROM user u
         INNER JOIN user_referee ur ON u.id = ur.user_id AND ur.deleted_at IS NULL
         INNER JOIN referee r ON ur.referee_id = r.id
         INNER JOIN referee_gender rg ON r.id = rg.referee_id AND rg.deleted_at IS NULL
         INNER JOIN gender g ON rg.gender_id = g.id
WHERE u.deleted_at IS NULL
  AND r.id = :pRefereeId;


-- EQUIPOS

-- Obtener lista de equipos
SELECT t.id    AS id,
       t.name  AS name,
       t.coach AS coach,
       g.name  AS gender,
       s.name  AS sub,
       c.name  AS club
FROM team t
         INNER JOIN team_sub ts ON t.id = ts.team_id AND ts.deleted_at IS NULL
         INNER JOIN sub s ON ts.sub_id = s.id AND s.deleted_at IS NULL
         INNER JOIN team_gender tg ON t.id = tg.team_id AND tg.deleted_at IS NULL
         INNER JOIN gender g ON tg.gender_id = g.id
         INNER JOIN club_team ct ON t.id = ct.team_id AND ct.deleted_at IS NULL
         INNER JOIN club c ON ct.club_id = c.id
WHERE t.deleted_at IS NULL;

-- Obtener equipo por id
SELECT t.id   AS id,
       t.name,
       t.coach,
       g.id   AS gender,
       s.id   AS sub,
       c.name AS club
FROM team t
         INNER JOIN team_sub ts ON t.id = ts.team_id AND ts.deleted_at IS NULL
         INNER JOIN sub s ON ts.sub_id = s.id AND s.deleted_at IS NULL
         INNER JOIN team_gender tg ON t.id = tg.team_id AND tg.deleted_at IS NULL
         INNER JOIN gender g ON tg.gender_id = g.id
         INNER JOIN club_team ct ON t.id = ct.team_id AND ct.deleted_at IS NULL
         INNER JOIN club c ON ct.club_id = c.id
WHERE t.deleted_at IS NULL
  AND t.id = :pTeamId;

-- CLUBES

-- Obtener lista de clubes
SELECT club.id,
       JSON_UNQUOTE(JSON_EXTRACT(club.logo, '$[0].name')) AS logo,
       club.name,
       club.social_networks                               AS socialNetworks,
       club.email,
       club.phone
FROM club
WHERE club.deleted_at IS NULL;

-- Verificar disponibilidad de nombre de club
SELECT CASE
           WHEN EXISTS (SELECT name
                        FROM club
                        WHERE name = :clubName
                          AND deleted_at IS NULL)
               THEN TRUE
           ELSE FALSE END;

-- Obtener club por id
SELECT club.id,
       JSON_UNQUOTE(JSON_EXTRACT(club.logo, '$[0].name')) AS logo,
       club.name,
       club.social_networks                               AS socialNetworks,
       club.email,
       club.phone
FROM club
WHERE club.deleted_at IS NULL
  AND club.id = :clubId;

-- PARTIDOS

-- Obtener lista de partidos
SELECT gm.id,
       gm.name,
       gm.game_date,
       gm.game_time,
       s.name AS sub,
       g.name AS gender,
       u.name AS referee,
       f.id  AS fieldId
FROM game gm
         INNER JOIN game_sub gs ON gm.id = gs.game_id AND gs.deleted_at IS NULL
         INNER JOIN sub s ON gs.sub_id = s.id AND s.deleted_at IS NULL
         INNER JOIN game_gender gg ON gm.id = gg.game_id AND gg.deleted_at IS NULL
         INNER JOIN gender g ON gg.gender_id = g.id AND g.deleted_at IS NULL
         INNER JOIN game_referee gr ON g.id = gr.game_id AND gr.deleted_at IS NULL
         INNER JOIN referee r ON gr.referee_id = r.id AND r.deleted_at IS NULL
         INNER JOIN user_referee ur ON r.id = ur.referee_id AND ur.deleted_at IS NULL
         INNER JOIN user u ON ur.user_id = u.id AND u.deleted_at IS NULL
         INNER JOIN field_game fg ON gm.id = fg.game_id AND fg.deleted_at IS NULL
         INNER JOIN field f ON fg.field_id = f.id AND f.deleted_at IS NULL
WHERE gm.deleted_at IS NULL;

-- Obtener juego por id
SELECT gm.id,
       gm.name,
       gm.game_date AS gameDate,
       gm.game_time AS gameTime,
       sub.id       AS subId,
       g.id         AS genderId,
       r.id         AS refereeId,
       f.id         AS fieldId
FROM game gm
         INNER JOIN game_sub gs ON gm.id = gs.game_id AND gs.deleted_at IS NULL
         INNER JOIN sub sub ON gs.sub_id = sub.id AND sub.deleted_at IS NULL
         INNER JOIN game_gender gg ON gm.id = gg.game_id AND gg.deleted_at IS NULL
         INNER JOIN gender g ON gg.gender_id = g.id AND g.deleted_at IS NULL
         INNER JOIN game_referee gr ON gm.id = gr.game_id AND gr.deleted_at IS NULL
         INNER JOIN referee r ON gr.referee_id = r.id AND r.deleted_at IS NULL
        INNER JOIN field_game fg ON gm.id = fg.game_id AND fg.deleted_at IS NULL
         INNER JOIN field f ON fg.field_id = f.id AND f.deleted_at IS NULL
WHERE gm.deleted_at IS NULL
  AND gm.id = :pGameId;

-- Obtener lista de equipos por id del partido
SELECT g.id   AS gameId,
       g.name AS gameName,
       t.id   AS teamId,
       t.name AS teamName,
       t.coach
FROM game g
         LEFT JOIN game_team gt ON g.id = gt.game_id
         LEFT JOIN team t ON gt.team_id = t.id
WHERE g.id = :pGameId
  AND gt.deleted_at IS NULL;

-- TORNEOS

-- Obtener lista de torneos


-- CATEGORIAS

-- Obtener lista de categorias por edades (subs)
SELECT sub.id,
       sub.name,
       sub.max_age AS maxAge,
       sub.min_age AS minAge
FROM sub
WHERE sub.deleted_at IS NULL;

-- CANCHAS

-- Obtener lista de canchas
SELECT field.id,
       field.logo,
       field.name,
       field.address,
       field.phone,
       field.email,
       field.capacity
FROM field
WHERE field.deleted_at IS NULL;

