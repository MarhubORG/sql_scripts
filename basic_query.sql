SELECT
  "textitSessionId" as "Unique Session Id",
  "textitContactUuid" as "Contact UUID",
  "createdAt" as "Created On",
  data -> 'fields' ->> 'handoff_timestamp' as "Handoff Timestamp",
  "textitContactName" as "Name"
FROM "TextitSessions"
WHERE
  "createdAt" > '2/02/2020'
ORDER BY
  "createdAt" ASC
LIMIT
  10;