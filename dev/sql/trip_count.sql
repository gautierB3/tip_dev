
SELECT count(DISTINCT itapudid) as distinct_itapudid, count(*) as trips FROM (

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
) foo;