\c pit-dev

DROP TABLE dimdevices;
-- create new table device 
CREATE TABLE dimdevices(
	itapudid varchar NOT NULL,
	lastUpdate timestamp NULL
);
-- Insert devices already contained in dimtrip
INSERT INTO dimdevices (itapudid, lastUpdate)

	SELECT itapudid, max("LastChangeDate") AS last_update

	FROM dimtrip 
	GROUP BY itapudid

;
-- find new devices from 'event' tables and insert them  into device table
INSERT INTO dimdevices (itapudid)

SELECT DISTINCT itapudid FROM absevent

UNION

SELECT DISTINCT itapudid FROM asyncevent

UNION

SELECT DISTINCT itapudid FROM brakeconditionevent

UNION

SELECT DISTINCT itapudid FROM dtcevent

UNION

SELECT DISTINCT itapudid FROM ebschangeevent

UNION

SELECT DISTINCT itapudid FROM gpstrackevent

UNION

SELECT DISTINCT itapudid FROM internalstatusevent

UNION

SELECT DISTINCT itapudid FROM loadevent

UNION

SELECT DISTINCT itapudid FROM longitudinalshockevent

UNION

SELECT DISTINCT itapudid FROM poweroffevent

UNION

SELECT DISTINCT itapudid FROM poweroffslevent

UNION

SELECT DISTINCT itapudid FROM poweronevent

UNION

SELECT DISTINCT itapudid FROM rspevent

UNION

SELECT DISTINCT itapudid FROM statusevent

UNION

SELECT DISTINCT itapudid FROM tmpsevent

UNION

SELECT DISTINCT itapudid FROM verticalshockevent

EXCEPT

SELECT DISTINCT itapudid FROM dimtrip
;
-- search for last update in 'event' tables