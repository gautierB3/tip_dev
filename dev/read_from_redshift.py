#!/usr/bin/python
import psycopg2
import sys

from sqlalchemy import create_engine, MetaData, Table


def get_tables():
    engine = create_engine(
        "redshift+psycopg2://analysis:dU*eXNzg.dH^?_:y32mu@fleetremote-prd.csnqydpupptn.eu-west-1.redshift.amazonaws.com:5439/fleetremote_acp")
    


    meta = MetaData()
    meta.reflect(bind=engine)
    #print len(meta.tables)
    #for key, value in meta.tables.iteritems():
    #    print key
    return meta.tables


if __name__ == "__main__":

    tables = get_tables()
    print str(len(tables)) + " tables found.\nHere they are:"
    for table in tables:
        print table
        