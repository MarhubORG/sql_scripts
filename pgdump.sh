psql -h marhub-database2.cytzl3ilzpvr.us-east-1.rds.amazonaws.com -d marhub_dev -U marhub_readonly   -c 'pgdump "TextitSessions" TO STDOUT' > pgdumpMarch162020.sql