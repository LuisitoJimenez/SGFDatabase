SELECT
    user.id,
    user.name,
    user.birthday,
    user.gender,
    player.player_number AS playerNumber,
    player.photo,
    player.identification
FROM users user
    LEFT JOIN users_players userPlayer ON user.id = userPlayer.user_id
    LEFT JOIN players player ON userPlayer.player_id = player.id
WHERE userPlayer.deleted IS NULL
ORDER BY user.id ASC;