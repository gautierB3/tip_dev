SELECT count(DISTINCT itapudid) from

(SELECT DISTINCT

      'OnOff' as TripType,
      COALESCE(O1.itapudid ,O2.itapudid) AS itapudid,
      COALESCE(O1.accountid, O2.accountid) AS Accountid, 
      coalesce(O1.servprvder, O2.servprvder) as servprvder,
      COALESCE(O1.drivenum, O2.drivenum) AS FirstDrivenum,
      COALESCE(O1.drivenum, O2.drivenum) AS LastDrivenum,  
      to_timestamp(O1.eventtime, 'YYYY-MM-DD HH24:MI:SS') AS TripStartTime,  
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

  INNER JOIN

  dimdevices D

  ON D.itapudid = COALESCE(O1.itapudid, O2.itapudid)

    LEFT JOIN

    dimtrip DT

    ON DT.itapudid = COALESCE(O1.itapudid, O2.itapudid)

    AND DT.firstdrivenum = COALESCE(O1.drivenum, O2.drivenum)

    AND DT.lastdrivenum = COALESCE(O1.drivenum, O2.drivenum)

  WHERE (O1.created_at > D.lastupdate

  OR O2.created_at > D.lastupdate)

  AND DT.itapudid IS NULL
) foo;