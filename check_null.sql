SELECT
  COUNT(*)
FROM "TextitSessions"
WHERE
  data -> 'fields' ->> 'handoff_timestamp' IS NOT NULL;