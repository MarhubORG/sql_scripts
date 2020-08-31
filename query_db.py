import psycopg2
try:
    UNIQUE_SESSION_ID = ''
    USER = ''
    PASSWORD = ''
    HOST = ''
    PORT = ''
    DATABASE = ''
    QUERY_STRING = f"SELECT attributes FROM srv_channel_users_sesssions WHERE attributes ->> 'uniqueSessionId' = '{UNIQUE_SESSION_ID}';"

    connection = psycopg2.connect(user=USER,
                                  password= PASSWORD,
                                  host=HOST,
                                  port=PORT,
                                  database=DATABASE)
    cursor = connection.cursor()
    cursor.execute(QUERY_STRING)
    record = cursor.fetchone()[0]
    keys = []
    for key in record:
        keys.append(key)
    keys.sort()
    for key in keys:
        print(key, record[key])
    
except (Exception, psycopg2.Error) as error:
    print ("Error while connecting to PostgreSQL", error)
