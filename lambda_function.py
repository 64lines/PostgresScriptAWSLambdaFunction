import psycopg2
from datetime import datetime

def lambda_handler(event, context):
    con = psycopg2.connect(
        dbname='somedb', 
        host='someurl', 
        port='5439', 
        user='test', 
        password='test')

    with con.cursor() as cur:
        cur.execute(open("script.sql", "r").read())

    con.commit()
    cur.close()
    con.close()