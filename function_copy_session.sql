CREATE OR REPLACE FUNCTION function_copy_session() RETURNS TRIGGER AS $$
DECLARE copied_channel srv_channel_users.channel %TYPE;
copied_user_id srv_channel_users.user_id %TYPE;
copied_attributes srv_channel_users.attributes %TYPE;
copied_created_at srv_channel_users.created_at %TYPE;
copied_updated_at srv_channel_users.updated_at %TYPE;
session_channel varchar;
session_user_id varchar;
BEGIN session_channel := (
  SELECT split_part(OLD.id, '::', 1)
);
session_user_id := (
  SELECT split_part(OLD.id, '::', 2)
);
SELECT channel,
  user_id,
  attributes,
  created_at,
  updated_at INTO copied_channel,
  copied_user_id,
  copied_attributes,
  copied_created_at,
  copied_updated_at
FROM srv_channel_users
WHERE user_id = session_user_id
  AND channel = session_channel
ORDER BY updated_at DESC
LIMIT 1;
INSERT INTO srv_channel_users_sesssions(
    channel,
    user_id,
    attributes,
    created_at,
    updated_at
  )
VALUES(
    copied_channel,
    copied_user_id,
    copied_attributes,
    copied_created_at,
    copied_updated_at
  );
RETURN OLD;
END;
$$ language plpgsql;
