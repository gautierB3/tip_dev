#!/usr/bin/python
import csv
import psycopg2
import sys

from sqlalchemy import create_engine, MetaData, Table

def get_tables():
    engine = create_engine("postgresql+psycopg2://gaut:gateaux@/pit-dev")
    meta = MetaData()
    meta.reflect(bind=engine)
    #print len(meta.tables)
    #for key, value in meta.tables.iteritems():
    #    print key
    return meta.tables

def get_unique_trips():
    conn = psycopg2.connect(host="localhost",database="pit-dev", user="gaut", password="gateaux")
    cur = conn.cursor()
    sql = 'SELECT DISTINCT "tripId" FROM fcttripevents;'
    cur.execute(sql)
    events = cur.fetchall()
    cur.close()
    conn.close()
    return events


def get_rows(tripId, table):
    conn = psycopg2.connect(host="localhost",database="pit-dev", user="gaut", password="gateaux")
    cur = conn.cursor()
    sql = 'SELECT "bssid" FROM %s WHERE "drivenum" = %s;' % (table, tripId)
    cur.execute(sql)
    rows = cur.fetchall()
    cur.close()
    conn.close()
    return rows

def write_to_csv(data, path="/home/gaut/Projects/pit/data.csv"):
    with open(path, 'wb') as f:
        writer = csv.writer(f, delimiter=',', quotechar='"')
        for row in data:
            writer.writerow(row)

 
if __name__ == "__main__":
    tables = get_tables()
    print len(tables)
    for table in tables:
        print table
    event_tables = [table for table in tables if "dim" not in table]
    single_event_tables = [table for table in event_tables if "events" not in table]
    print "-------------------"
    print len(event_tables)
    for table in event_tables:
        print table
    print "-------------------"
    trips = get_unique_trips()
    print len(trips)
    print trips[0][0]
    data = []
    for trip in trips[:10]:
        for table in single_event_tables:
            rows = get_rows(trip[0], table)
            for row in rows:
                data.append([trip[0], table, row[0]])
    print data[:10]
    write_to_csv(data)

