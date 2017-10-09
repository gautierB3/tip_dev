#!/usr/bin/python
import psycopg2
import sys

from sqlalchemy import create_engine, MetaData, Table

def get_tables(database):
    engine = create_engine("postgresql+psycopg2://gaut:gateaux@/%s" % database)
    meta = MetaData()
    meta.reflect(bind=engine)
    #print len(meta.tables)
    #for key, value in meta.tables.iteritems():
    #    print key
    return meta.tables

def get_unique_trips_from_dimtrip():
    sql = 'SELECT DISTINCT tripId FROM dimtrip;'
    cur.execute(sql)
    trips = cur.fetchall()
    return trips

def get_unique_devices_from_dimtrip():
    sql = 'SELECT DISTINCT itapudid FROM dimtrip;'
    cur.execute(sql)
    devices = cur.fetchall()
    return devices

def get_last_update_for_device_from_dimtrip():
    sql = 'SELECT itapudid, max(lastchangedate) FROM dimtrip GROUP BY itapudid;'
    cur.execute(sql)
    devices = cur.fetchall()
    return devices


def find_newer_entry_for_device_in_table(table, last_update, itapudid):
    sql = "SELECT itapudid, created_at FROM %s WHERE created_at > '%s' AND itapudid = '%s'" % (table, str(last_update), itapudid)
    cur.execute(sql)
    rows = cur.fetchall()
    return rows


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


def execute_trip_sql():
    sql = """

        DROP TABLE dimtrip;

        CREATE TABLE dimtrip (
            TripId serial NOT NULL, 
            TripType char(5),
            itapudid varchar NULL,
            Accountid varchar NULL,
            servprvder int null, 
            FirstDrivenum bigint NULL,
            LastDrivenum bigint NULL,
            TripStartTime timestamp NULL,
            TripEndTime timestamp NULL,
            TripDuration interval NULL, 
            TrailerVin char(17) null, 
            TruckVin char(17) null , 

            LastChangeDate timestamp default(current_date)
        );

        INSERT INTO dimtrip (
            TripType, 
            itapudid,
            Accountid,
            servprvder,
            FirstDrivenum,
            LastDrivenum,
            TripStartTime,
            TripEndTime,
            TripDuration 
            )


        SELECT DISTINCT 
            'OnOff' as TripType, 
              COALESCE(O1.itapudid ,O2.itapudid) AS itapudid
            , COALESCE(O1.accountid, O2.accountid) AS Accountid
              , coalesce(O1.servprvder, O2.servprvder) as servprvder
              ,COALESCE(O1.drivenum, O2.drivenum) AS FirstDrivenum
              ,COALESCE(O1.drivenum, O2.drivenum) AS LastDrivenum
           
              ,  to_timestamp(O1.eventtime, 'YYYY-MM-DD HH24:MI:SS') AS TripStartTime,  
              to_timestamp(O2.eventtime, 'YYYY-MM-DD HH24:MI:SS') AS TripEndTime,
              to_timestamp(O2.eventtime, 'YYYY-MM-DD HH24:MI:SS') - to_timestamp(O1.eventtime, 'YYYY-MM-DD HH24:MI:SS') AS TripDuration

          FROM 
            poweronevent O1
            FULL JOIN 
            poweroffevent O2
          on 
            O1.itapudid = O2.itapudid 
            AND 
            o1.drivenum = O2.drivenum
         
        UNION ALL
        SELECT 
            'OffSl' as TripType, 

        A.itapudid, 
            A.accountid, 
            A.servprvder, 
            A.FirstDrivenum, 
                A.LastDrivenum, 

            TripStartTime, 
            TripEndTime, 
            TripEndTime - TripStartTime AS TripDuration
        FROM 
        (
        SELECT distinct 
               A.itapudid AS itapudid,
               A.AccountId, 
               A.servprvder,
               MIN(A.Drivenum) as FirstDrivenum, 
               MAX(A.Drivenum) AS LastDrivenum
          FROM 
          poweroffslevent A
          LEFT JOIN 
          poweroffslevent B
          ON A.itapudid = B.itapudid
          AND A.accountid = B.accountid
          and A.drivenum = B.drivenum + 1
        GROUP BY A.itapudid, A.AccountId, A.servprvder
        ) A
        LEFT JOIN 
        (
        SELECT distinct 
               A.itapudid AS itapudid,
               A.AccountId, 
               A.Drivenum, 
                to_timestamp(A.eventtime, 'YYYY-MM-DD HH24:MI:SS') AS TripStartTime
        FROM 
        poweroffslevent A
        ) B 
        ON A.itapudid = B.itapudid 
        AND A.FirstDrivenum = B.drivenum
        AND A.accountid = B.accountid
        LEFT JOIN 
        (
        SELECT distinct 
               A.itapudid AS itapudid,
               A.AccountId, 
               A.Drivenum, 
                to_timestamp(A.eventtime, 'YYYY-MM-DD HH24:MI:SS') AS TripEndTime
        FROM 
        poweroffslevent A
        ) C
        ON A.itapudid = C.itapudid 
        AND A.LastDrivenum = C.drivenum
        AND A.accountid = C.accountid


    """
    cur.execute(sql)
    return None


if __name__ == "__main__":

    database = sys.argv[1]

    print "Database in use: %s" % database

    # get all tables from database meta
    tables = get_tables(database)

    # get all event tables in a list
    event_tables = [table for table in tables if "dim" not in table]
    event_tables = [table for table in event_tables if "events" not in table]

    print str(len(event_tables)) + " tables found.\nNamely:"
    print "------------------------"
    for table in event_tables:
        print table

    

    # connect to database
    conn = psycopg2.connect(host="localhost",database=database, user="gaut", password="gateaux")
    cur = conn.cursor()
    print "Successfully connected to database: " + database
    
    event_found = []
    trip_found = []
    event_tables = []

    print "Now counting unique devices and trips in event tables ..."

    for table in event_tables:
        events = get_events_in_table(table)
        for event in events:
            event_found.append(event[0])
            trip_found.append(event[0] + str(event[1]))
    print str(len(event_found)) + " events found in all event tables."
    print str(len(set(event_found))) + " disctinct devices found in all event tables."
    print str(len(set(trip_found))) + " disctinct trips found in all event tables."

    print "Now executing trip.sql ..."

    execute_trip_sql()

    trips_in_dimtrip = get_unique_trips_from_dimtrip()

    print "Assert equal to trips initially found: " + str(len(trip_found) == len(trips_in_dimtrip))
    if not len(trip_found) == len(trips_in_dimtrip):
        print "Diff = " + str(len(set(trip_found)) - len(trips_in_dimtrip))

    devices_in_dimtrip = get_unique_devices_from_dimtrip()

    print "Assert equal to devices initially found: " + str(len(set(event_found)) == len(devices_in_dimtrip))
    if not len(set(event_found)) == len(devices_in_dimtrip):
        print "Diff = " + str(len(set(event_found)) - len(devices_in_dimtrip))

    # # get unique trip in fcttripevents
    # trips = get_unique_trips_from_dimtrip()
    # print "There are " + str(len(trips)) + " unique trips initially found in dim trip."

    # devices = get_last_update_for_device_from_dimtrip()
    # print "There are " + str(len(devices)) + " unique devices initially found in dim trip."
    # print "Here are the first 10:"
    # for device in devices[:10]:
    #     print device[0] + " : " + str(device[1])


    # newer_updates = []
    # for table in event_tables:
    #     for device in devices:
    #         rows = find_newer_entry_for_device_in_table(table, device[1], device[0])
    #         if rows:
    #             print str(len(rows)) + " row(s) found."
    #             for row in rows:
    #                 newer_updates.append(row + (table, ))
    #         #else:
    #             #print "Nothing in " + table + " for device: " + device[0]
    # if newer_updates:
    #     print "Printing results...."
    #     for u in newer_updates:
    #         print u
    

    # close connection to database
    cur.close()
    conn.close()

