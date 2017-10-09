#!/usr/bin/python
import psycopg2
import sys

from collections import Counter


from sqlalchemy import create_engine, MetaData, Table

def get_tables(database):
    engine = create_engine("postgresql+psycopg2://gaut:gateaux@/%s" % database)
    meta = MetaData()
    meta.reflect(bind=engine)
    #print len(meta.tables)
    #for key, value in meta.tables.iteritems():
    #    print key
    return meta.tables

# def get_unique_trips_from_dimtrip():
#     sql = 'SELECT DISTINCT tripId FROM dimtrip;'
#     cur.execute(sql)
#     trips = cur.fetchall()
#     return trips

# def get_unique_devices_from_dimtrip():
#     sql = 'SELECT DISTINCT itapudid FROM dimtrip;'
#     cur.execute(sql)
#     devices = cur.fetchall()
#     return devices

# def get_last_update_for_device_from_dimtrip():
#     sql = 'SELECT itapudid, max(lastchangedate) FROM dimtrip GROUP BY itapudid;'
#     cur.execute(sql)
#     devices = cur.fetchall()
#     return devices


# def find_newer_entry_for_device_in_table(table, last_update, itapudid):
#     sql = "SELECT itapudid, created_at FROM %s WHERE created_at > '%s' AND itapudid = '%s'" % (table, str(last_update), itapudid)
#     cur.execute(sql)
#     rows = cur.fetchall()
#     return rows


# def get_events(tripId, table):
#     print "Getting rows from " + table
#     sql = 'SELECT "bssid" FROM %s WHERE "drivenum" = %s;' % (table, tripId)
#     cur.execute(sql)
#     rows = cur.fetchall()
#     return rows


def get_events_in_table(table):
    sql = "SELECT itapudid, drivenum FROM %s;" % table
    cur.execute(sql)
    rows = cur.fetchall()
    return rows

def get_distinct_itapudid_in_table(table):
    sql = "SELECT DISTINCT itapudid FROM %s;" % table
    cur.execute(sql)
    rows = cur.fetchall()
    return rows


def execute_fact_sql():
    sql = """"""
    cur.execute(sql)
    return None


if __name__ == "__main__":

    database = sys.argv[1]

    print "Database in use: %s" % database

    # get all tables from database meta
    tables = get_tables(database)

    if sys.argv[2] == "all":
        # get all event tables in a list
        event_tables = [table for table in tables if "dim" not in table]
        event_tables = [table for table in event_tables if "events" not in table]
    else:
        event_tables = list([sys.argv[2]])


    print str(len(event_tables)) + " tables found.\nNamely:"
    print "------------------------"
    for table in event_tables:
        print table

    

    # connect to database
    conn = psycopg2.connect(host="localhost",database=database, user="gaut", password="gateaux")
    cur = conn.cursor()
    print "Successfully connected to database: " + database
    
    event_by_tables = []

    print "Now counting events in event tables ..."

    for table in event_tables:
        temp_dict = {'table':table, 'events':[]}
        events = get_events_in_table(table)
        for event in events:
            temp_dict['events'].append( event[0] + " : " + str(event[1]) )
        event_by_tables.append(temp_dict)

    for table in event_by_tables:
        C = Counter(table['events'])
        table['c'] = C
        # table['count'] = [ [k,]*v for k,v in C.items() ]
        print table['table'], ": Total of", len(table['events']), "events and ", len(table['c']), " unique trips."
        # for i in table['count']:
            # print i[0], " : ",  len(i)
        #for k, v in table['c'].items():
        #    print k, " Count: ", v






    # print "Now executing trip.sql ..."

    # execute_fact_sql()

    # trips_in_dimtrip = get_unique_trips_from_dimtrip()

    # print "Assert equal to trips initially found: " + str(len(trip_found) == len(trips_in_dimtrip))
    # if not len(trip_found) == len(trips_in_dimtrip):
    #     print "Diff = " + str(len(set(trip_found)) - len(trips_in_dimtrip))

    # devices_in_dimtrip = get_unique_devices_from_dimtrip()

    # print "Assert equal to devices initially found: " + str(len(set(event_found)) == len(devices_in_dimtrip))
    # if not len(set(event_found)) == len(devices_in_dimtrip):
    #     print "Diff = " + str(len(set(event_found)) - len(devices_in_dimtrip))
    

    # close connection to database
    cur.close()
    conn.close()

