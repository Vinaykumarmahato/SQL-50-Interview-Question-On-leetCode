WITH playersMinEventDate(player_id, event_date) 

AS (
  SELECT player_id, MIN(event_date)
  FROM Activity
  GROUP BY player_id
)

activePlayersCount (players_count)

AS (
  SELECT COUNT(_activity.player_id)
  FROM Activity _activity
  LEFT JOIN playersMinEventDate _min_event_date ON _activity.player_id = _min_event_date.player_id
  WHERE DATE_ADD(_min_event_date.event_date, INTERVAL 1 DAY) = _activity.event_date
)

SELECT ROUND(players_count / COUNT(DISTINCT _activity.player_id), 2) AS fraction
FROM Activity _activity, activePlayersCount