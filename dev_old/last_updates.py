#!/usr/bin/python
import datetime
import psycopg2
import sys

from sqlalchemy import create_engine, MetaData, Table

def get_tables():
    engine = create_engine("postgresql+psycopg2://gaut:gateaux@/pit-dev")
    meta = MetaData()
    meta.reflect(bind=engine)
    return meta.tables

def find_newer_events_in_table(table, deviceId, time):
    sql = 'SELECT eventtime FROM %s WHERE itapudid = \'%s\' AND eventtime::integer > %s;' % (table, deviceId, time.strftime('%s'))
    cur.execute(sql)
    rows = cur.fetchall()
    return rows

def get_device_last_update(deviceId):
    sql = 'SELECT max("LastChangeDate") FROM dimtrip WHERE itapudid = \'%s\';' % (deviceId,)
    cur.execute(sql)
    rows = cur.fetchall()
    return rows[0][0]

def get_devices_and_last_update():
    sql = 'SELECT itapudid, max("LastChangeDate") FROM dimtrip GROUP BY itapudid;'
    cur.execute(sql)
    rows = cur.fetchall()
    return rows

def human_time(epoch):
    return datetime.datetime.fromtimestamp(float(epoch)).strftime('%Y-%m-%d %H:%M:%S')


if __name__ == "__main__":
    tables = get_tables()
    event_tables = [table for table in tables if "dim" not in table]
    single_event_tables = [table for table in event_tables if "events" not in table]
    print "-------------------"
    conn = psycopg2.connect(host="localhost",database="pit-dev", user="gaut", password="gateaux")
    cur = conn.cursor()
    print "Connection established."
    devices = get_devices_and_last_update()
    data = []
    # deviceId = '163540034001DC924DB03'
    for device in devices:
        last_time = device[1]
        for table in single_event_tables:
            rows = find_newer_events_in_table(table, device[0], last_time)
            if rows:
                for row in rows:
                    print device[0] + ' in ' + table + ". Found " + human_time(row[0])
                data.append({'device':device[0], 'last_update':human_time(max(rows[0])) })
    
    cur.close()
    conn.close()
    print data
    
