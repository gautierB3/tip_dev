
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
   
	  ,  to_timestamp(CAST(O1.eventtime AS BIGINT)) AS TripStartTime
	  ,  to_timestamp(CAST(O2.eventtime AS BIGINT)) AS TripEndTime
	  , to_timestamp(CAST(O2.eventtime AS BIGINT)) - to_timestamp(CAST(O1.eventtime AS BIGINT)) AS TripDuration

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
	    to_timestamp(CAST(A.eventtime AS BIGINT)) AS TripStartTime
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
	    to_timestamp(CAST(A.eventtime AS BIGINT)) AS TripEndTime
FROM 
poweroffslevent A
) C
ON A.itapudid = C.itapudid 
AND A.LastDrivenum = C.drivenum
AND A.accountid = C.accountid
;

INSERT INTO dimtrip (
	TripType, 
	itapudid,
	Accountid,
	servprvder,
	FirstDrivenum,
	LastDrivenum
	)
SELECT distinct 'Fact' as TripType, A.itapudid, A.accountid, A.servprvder, A.drivenum AS FirstDrivenum, 
A.drivenum AS LastDriveNum
FROM 
(
select distinct 
      A.itapudid AS itapudid,
	   A.AccountId, 
	   A.servprvder,
	   A.Drivenum
FROM absevent A
union 
select distinct 
      A.itapudid AS itapudid,
	   A.AccountId, 
	   A.servprvder,
	   A.Drivenum
FROM asyncevent A
union 
select distinct 
      A.itapudid AS itapudid,
	   A.AccountId, 
	   A.servprvder,
	   A.Drivenum
FROM brakeconditionevent A
union 
select distinct 
      A.itapudid AS itapudid,
	   A.AccountId, 
	   A.servprvder,
	   A.Drivenum
FROM dtcevent A
union 
select distinct 
      A.itapudid AS itapudid,
	   A.AccountId, 
	   A.servprvder,
	   A.Drivenum
FROM ebschangeevent A
union 
select distinct 
      A.itapudid AS itapudid,
	   A.AccountId, 
	   A.servprvder,
	   A.Drivenum
FROM gpstrackevent A
union 
select distinct 
      A.itapudid AS itapudid,
	   A.AccountId, 
	   A.servprvder,
	   A.Drivenum
FROM internalstatusevent A
union 
select distinct 
      A.itapudid AS itapudid,
	   A.AccountId, 
	   A.servprvder,
	   A.Drivenum
FROM loadevent A
union 
select distinct 
      A.itapudid AS itapudid,
	   A.AccountId, 
	   A.servprvder,
	   A.Drivenum
FROM longitudinalshockevent A
union 
select distinct 
      A.itapudid AS itapudid,
	   A.AccountId, 
	   A.servprvder,
	   A.Drivenum
FROM rspevent A
union 
select distinct 
      A.itapudid AS itapudid,
	   A.AccountId, 
	   A.servprvder,
	   A.Drivenum
FROM statusevent A
union 
select distinct 
      A.itapudid AS itapudid,
	   A.AccountId, 
	   A.servprvder,
	   A.Drivenum
FROM tmpsevent A
union 
select distinct 
      A.itapudid AS itapudid,
	   A.AccountId, 
	   A.servprvder,
	   A.Drivenum
FROM verticalshockevent A
) A
left join 
dimtrip B 
on A.drivenum between B.FirstDrivenum and B.LastDrivenum
AND 
A.itapudid = B.itapudid
and 
A.accountid = B.Accountid
where B.itapudid is null 
;
UPDATE dimtrip
SET 
	TrailerVin = A.TrailerVin, 
	TruckVin = A.TruckVin
FROM 
	dimtrip B
	inner join 
	asyncevent A
ON 
	A.accountid = B.Accountid
	AND 
	A.drivenum between B.FirstDrivenum and B.LastDrivenum
	AND 
	A.itapudid = B.itapudid
;
