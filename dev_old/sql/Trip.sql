USE [TIP]
GO

/****** Object:  Table [dbo].[DimTrip]    Script Date: 22/01/2017 21:30:14 ******/
DROP TABLE [dbo].[DimTrip]
GO

/****** Object:  Table [dbo].[DimTrip]    Script Date: 22/01/2017 21:30:14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimTrip](
	TripId int identity(1,1) NOT NULL, 
	TripType char(5),
	[itapudid] [nvarchar](max) NULL,
	[Accountid] [nvarchar](max) NULL,
	servprvder int null, 
		[FirstDrivenum] [bigint] NULL,
	[LastDrivenum] [bigint] NULL,
	[TripStartTime] [datetime] NULL,
	[TripEndTime] [datetime] NULL,
	[TripDuration] [int] NULL, 
	TrailerVin char(17) null, 
	TruckVin char(17) null , 

	LastChangeDate datetime default(getdate())
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

INSERT INTO dbo.DimTrip (
	TripType, 
	[itapudid],
	[Accountid],
	servprvder,
	[FirstDrivenum],
	[LastDrivenum],
	[TripStartTime],
	[TripEndTime],
	[TripDuration] 
	)
SELECT DISTINCT 
	'OnOff' as TripType, 
      COALESCE(O1.[itapudid] ,O2.[itapudid]) AS itapudid
	, COALESCE(O1.[accountid], O2.[accountid]) AS Accountid
	  , coalesce(O1.servprvder, O2.servprvder) as servprvder
      ,COALESCE(O1.[drivenum], O2.drivenum) AS FirstDrivenum
      ,COALESCE(O1.[drivenum], O2.drivenum) AS LastDrivenum
   
	  ,  DATEADD(S, CAST(O1.[eventtime] AS BIGINT), '1970-01-01') AS TripStartTime
	  ,  DATEADD(S, CAST(O2.[eventtime] AS BIGINT), '1970-01-01') AS TripEndTime
	  , DATEDIFF(s, DATEADD(S, CAST(O1.[eventtime] AS BIGINT), '1970-01-01')
	  ,  DATEADD(S, CAST(O2.[eventtime] AS BIGINT), '1970-01-01')) AS TripDuration

  FROM 
	[TIP].[dbo].[poweronevent] O1
	FULL JOIN 
	TIP.dbo.poweroffevent O2
  on 
	O1.[itapudid] = O2.[itapudid] 
	AND 
	o1.[drivenum] = O2.[drivenum]
 
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
	DATEDIFF(s, TripStartTime, TripEndTime) AS TripDuration
FROM 
(
SELECT distinct 
       A.[itapudid] AS itapudid,
	   A.AccountId, 
	   A.servprvder,
	   MIN(A.Drivenum) as FirstDrivenum, 
	   MAX(A.Drivenum) AS LastDrivenum
  FROM 
  [TIP].[dbo].[poweroffslevent] A
  LEFT JOIN 
  [TIP].[dbo].[poweroffslevent] B
  ON A.itapudid = B.itapudid
  AND A.accountid = B.accountid
  and A.drivenum = B.drivenum + 1
GROUP BY A.[itapudid], A.AccountId, A.servprvder
) A
LEFT JOIN 
(
SELECT distinct 
       A.[itapudid] AS itapudid,
	   A.AccountId, 
	   A.Drivenum, 
	    DATEADD(S, CAST(A.[eventtime] AS BIGINT), '1970-01-01') AS TripStartTime
FROM 
[TIP].[dbo].[poweroffslevent] A
) B 
ON A.itapudid = B.itapudid 
AND A.FirstDrivenum = B.drivenum
AND A.accountid = B.accountid
LEFT JOIN 
(
SELECT distinct 
       A.[itapudid] AS itapudid,
	   A.AccountId, 
	   A.Drivenum, 
	    DATEADD(S, CAST(A.[eventtime] AS BIGINT), '1970-01-01') AS TripEndTime
FROM 
[TIP].[dbo].[poweroffslevent] A
) C
ON A.itapudid = C.itapudid 
AND A.LastDrivenum = C.drivenum
AND A.accountid = C.accountid


INSERT INTO dbo.DimTrip (
	TripType, 
	[itapudid],
	[Accountid],
		servprvder, 

	[FirstDrivenum],
	[LastDrivenum]
	)
SELECT distinct 'Fact' as TripType, A.itapudid, A.accountid, A.servprvder, A.drivenum AS FirstDrivenum, 
A.drivenum AS LastDriveNum
FROM 
(
select distinct 
      A.[itapudid] AS itapudid,
	   A.AccountId, 
	   A.servprvder,
	   A.Drivenum
FROM dbo.absevent A
union 
select distinct 
      A.[itapudid] AS itapudid,
	   A.AccountId, 
	   A.servprvder,
	   A.Drivenum
FROM dbo.asyncevent A
union 
select distinct 
      A.[itapudid] AS itapudid,
	   A.AccountId, 
	   A.servprvder,
	   A.Drivenum
FROM dbo.brakeconditionevent A
union 
select distinct 
      A.[itapudid] AS itapudid,
	   A.AccountId, 
	   A.servprvder,
	   A.Drivenum
FROM dbo.dtcevent A
union 
select distinct 
      A.[itapudid] AS itapudid,
	   A.AccountId, 
	   A.servprvder,
	   A.Drivenum
FROM dbo.ebschangeevent A
union 
select distinct 
      A.[itapudid] AS itapudid,
	   A.AccountId, 
	   A.servprvder,
	   A.Drivenum
FROM dbo.gpstrackevent A
union 
select distinct 
      A.[itapudid] AS itapudid,
	   A.AccountId, 
	   A.servprvder,
	   A.Drivenum
FROM dbo.internalstatusevent A
union 
select distinct 
      A.[itapudid] AS itapudid,
	   A.AccountId, 
	   A.servprvder,
	   A.Drivenum
FROM dbo.loadevent A
union 
select distinct 
      A.[itapudid] AS itapudid,
	   A.AccountId, 
	   A.servprvder,
	   A.Drivenum
FROM dbo.longitudinalshockevent A
union 
select distinct 
      A.[itapudid] AS itapudid,
	   A.AccountId, 
	   A.servprvder,
	   A.Drivenum
FROM dbo.rspevent A
union 
select distinct 
      A.[itapudid] AS itapudid,
	   A.AccountId, 
	   A.servprvder,
	   A.Drivenum
FROM dbo.statusevent A
union 
select distinct 
      A.[itapudid] AS itapudid,
	   A.AccountId, 
	   A.servprvder,
	   A.Drivenum
FROM dbo.tmpsevent A
union 
select distinct 
      A.[itapudid] AS itapudid,
	   A.AccountId, 
	   A.servprvder,
	   A.Drivenum
FROM dbo.verticalshockevent A
) A
left join 
dbo.DimTrip B 
on A.drivenum between B.FirstDrivenum and B.LastDrivenum
AND 
A.itapudid = B.itapudid
and 
A.accountid = B.Accountid
where B.itapudid is null 

UPDATE dbo.DimTrip
SET 
	TrailerVin = A.TrailerVin, 
	TruckVin = A.TruckVin
FROM 
	dbo.Dimtrip B
	inner join 
	dbo.asyncevent A
ON 
	A.accountid = B.Accountid
	AND 
	A.drivenum between B.FirstDrivenum and B.LastDrivenum
	AND 
	A.itapudid = B.itapudid


