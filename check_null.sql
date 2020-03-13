SELECT
  COUNT(*)
FROM "TextitSessions"
WHERE
  "createdAt" > '2/01/20'
  AND data -> 'fields' ->> 'handoff_timestamp' IS NOT NULL;