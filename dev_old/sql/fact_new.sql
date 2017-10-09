\c pit-dev

DROP TABLE fcttripevents;

CREATE TABLE fcttripevents (
	tripId int NOT NULL,
	DateId int NOT NULL, 
	/* absevent: 1 per absevent */
	abs_cnt_event int null,
	abs_min_ambtemp int NULL,
	abs_max_ambtemp int NULL,
	abs_avg_ambtemp int NULL,
	abs_min_duration int NULL,
	abs_max_duration int NULL,
	abs_avg_duration int NULL,
	abs_min_endspeed int NULL,
	abs_max_endspeed int NULL,
	abs_avg_endspeed int NULL,
	abs_min_maxbrakepress int NULL,
	abs_max_maxbrakepress int NULL,
	abs_avg_maxbrakepress int NULL,
	abs_min_maxlatacc int NULL,
	abs_max_maxlatacc int NULL,
	abs_avg_maxlatacc int NULL,
	abs_min_startspeed int NULL,
	abs_max_startspeed int NULL,
	abs_avg_startspeed int NULL,
	abs_cnt_warnlampstatOff int NULL,
	abs_cnt_warnlampstatYellow int NULL,
	abs_cnt_warnlampstatRed int NULL,
	/* async */
	async_cnt_event int null, 
	/* brakeconditioneent */
	brake_avg_long_acc_1to2bar smallint NULL,
	brake_max_long_acc_1to2bar smallint NULL,
	brake_num_brake_app_1to2bar smallint NULL,
	brake_p_avg_brake_app_1to2bar smallint NULL,
	brake_t_avg_brake_app_1to2bar smallint NULL,
	brake_t_max_brake_app_1to2bar smallint NULL,
	brake_avg_long_acc_2to3bar smallint NULL,
	brake_max_long_acc_2to3bar smallint NULL,
	brake_num_brake_app_2to3bar smallint NULL,
	brake_p_avg_brake_app_2to3bar smallint NULL,
	brake_t_avg_brake_app_2to3bar smallint NULL,
	brake_t_max_brake_app_2to3bar smallint NULL,
	brake_avg_long_acc_3to4bar smallint NULL,
	brake_max_long_acc_3to4bar smallint NULL,
	brake_num_brake_app_3to4bar smallint NULL,
	brake_p_avg_brake_app_3to4bar smallint NULL,
	brake_t_avg_brake_app_3to4bar smallint NULL,
	brake_t_max_brake_app_3to4bar smallint NULL,
	brake_avg_long_acc_4to5bar smallint NULL,
	brake_max_long_acc_4to5bar smallint NULL,
	brake_num_brake_app_4to5bar smallint NULL,
	brake_p_avg_brake_app_4to5bar smallint NULL,
	brake_t_avg_brake_app_4to5bar smallint NULL,
	brake_t_max_brake_app_4to5bar smallint NULL,
	brake_avg_long_acc_5to6bar smallint NULL,
	brake_max_long_acc_5to6bar smallint NULL,
	brake_num_brake_app_5to6bar smallint NULL,
	brake_p_avg_brake_app_5to6bar smallint NULL,
	brake_t_avg_brake_app_5to6bar smallint NULL,
	brake_t_max_brake_app_5to6bar smallint NULL,
	brake_avg_long_acc_above6bar smallint NULL,
	brake_max_long_acc_above6bar smallint NULL,
	brake_num_brake_app_above6bar smallint NULL,
	brake_p_avg_brake_app_above6bar smallint NULL,
	brake_t_avg_brake_app_above6bar smallint NULL,
	brake_t_max_brake_app_above6bar smallint NULL,
	brake_avg_long_acc_below1bar smallint NULL,
	brake_max_long_acc_below1bar smallint NULL,
	brake_num_brake_app_below1bar smallint NULL,
	brake_p_avg_brake_app_below1bar smallint NULL,
	brake_t_avg_brake_app_below1bar smallint NULL,
	brake_t_max_brake_app_below1bar smallint NULL,
	brake_avgload bigint NULL,
	brake_avgspeed int NULL,
	brake_maxload bigint NULL,
	brake_maxspeed int NULL,
	brake_minload bigint NULL,
	brake_numvertaccband1 bigint NULL,
	brake_numvertaccband2 bigint NULL,
	brake_numvertaccband3 bigint NULL,
	brake_numvertaccband4 bigint NULL,
	brake_numvertaccband5 bigint NULL,
	brake_numvertaccband6 bigint NULL,
	brake_numvertaccband7 bigint NULL,
	brake_tripdist int NULL,
	/* dtcevent */
	dtc_cnt_event int null, 
	dtc_cnt_event0 int null, 
	dtc_cnt_event1 int null,
	dtc_cnt_event2 int null, 
	dtc_cnt_event3 int null, 
	/* ebschange */
	ebs_cnt_event int null, 
	ebs_cnt_event0 int null, 
	ebs_cnt_event1 int null, 
	ebs_cnt_event2 int null,
	/* gpstrack */ 
	gps_cnt_event int null, 
	/* loadevent */
	load_confmaxloadkg bigint NULL,
	load_confminloadkg bigint NULL,
	load_tripdistload100to110 int NULL,
	load_tripdistload110to120 int NULL,
	load_tripdistload120to130 int NULL,
	load_tripdistload20t040 int NULL,
	load_tripdistload40to60 int NULL,
	load_tripdistload60to80 int NULL,
	load_tripdistload80to100 int NULL,
	load_tripdistloadabove130 int NULL,
	load_tripdistloadbelow20 int NULL,
	/* longitudinalshock */
	lshock_cnt_event int null, 
	lshock_avg_forwrevgear int NULL,
	lshock_min_forwrevgear int NULL,
	lshock_max_forwrevgear int NULL,
	lshock_avg_longacc int NULL,
	lshock_min_longacc int NULL,
	lshock_max_longacc int NULL,
	/* poweroff */
	off_avgload bigint NULL,
	off_avgspeed int NULL,
	off_max1stdetectwssa int NULL,
	off_max1stdetectwssb int NULL,
	off_max1stdetectwssc int NULL,
	off_max1stdetectwssd int NULL,
	off_max1stdetectwsse int NULL,
	off_max1stdetectwssf int NULL,
	off_maxlatacc int NULL,
	off_maxload bigint NULL,
	off_maxlongacc int NULL,
	off_maxp1presstrip int NULL,
	off_maxspeed int NULL,
	off_minload bigint NULL,
	off_minp1presstrip int NULL,
	off_p1presspoweroff int NULL,
	off_padwearstat int NULL,
	off_totaldist bigint NULL,
	off_tripdist int NULL,
	/* poweroffsl */
	offsl_avg_maxlatacc int NULL,
	offsl_min_maxlatacc int NULL,
	offsl_max_maxlatacc int NULL,
	offsl_avg_maxlongacc int NULL,
	offsl_min_maxlongacc int NULL,
	offsl_max_maxlongacc int NULL,
	offsl_avg_maxspeed int NULL,
	offsl_min_maxspeed int NULL,
	offsl_max_maxspeed int NULL,
	offsl_avg_minspeed int NULL,
	offsl_min_minspeed int NULL,
	offsl_max_minspeed int NULL,
	offsl_avg_p1presspoweroff int NULL,
	offsl_min_p1presspoweroff int NULL,
	offsl_max_p1presspoweroff int NULL,
	offsl_avg_tpowercycle int NULL,
	offsl_min_tpowercycle int NULL,
	offsl_max_tpowercycle int NULL,
	/* poweron */
	on_p1presspoweron int NULL,
	/* rsp */
	rsp_cnt_event int null,
	rsp_avg_duration int NULL,
	rsp_min_duration int NULL,
	rsp_max_duration int NULL,
	rsp_avg_endspeed int NULL,
	rsp_min_endspeed int NULL,
	rsp_max_endspeed int NULL,
	rsp_avg_maxbrakepress int NULL,
	rsp_min_maxbrakepress int NULL,
	rsp_max_maxbrakepress int NULL,
	rsp_avg_maxlatacc int NULL,
	rsp_min_maxlatacc int NULL,
	rsp_max_maxlatacc int NULL,
	rsp_avg_maxlongacc int NULL,
	rsp_min_maxlongacc int NULL,
	rsp_max_maxlongacc int NULL,
	rsp_avg_startspeed int NULL,
	rsp_min_startspeed int NULL,
	rsp_max_startspeed int NULL,
	rsp_cnt_warnlampstatOff int NULL,
	rsp_cnt_warnlampstatYellow int NULL,
	rsp_cnt_warnlampstatRed int NULL,
	/* status */
	tebs_cnt_event int null, 
	tebs_cnt_event0 int null, 
	tebs_cnt_event1 int null, 
	tebs_cnt_event2 int null,
	tpms_cnt_event int null, 
	tpms_cnt_event0 int null, 
	tpms_cnt_event1 int null, 
	tpms_cnt_event2 int null,

	vshock_cnt_event int null, 
	vshock_avg_forwrevgear int NULL,
	vshock_min_forwrevgear int NULL,
	vshock_max_forwrevgear int NULL,
	vshock_avg_vertacc int NULL,
	vshock_min_vertacc int NULL,
	vshock_max_vertacc int NULL,
);


INSERT INTO fcttripevents (TripId, DateId)
SELECT DISTINCT tripid, COALESCE(year(coalesce(tripstarttime, tripendtime)) * 10000 + 
month(coalesce(tripstarttime, tripendtime)) * 100 + day(coalesce(tripstarttime, tripendtime)), 0) 
from dimtrip
;
UPDATE fcttripevents
set 
	abs_cnt_event = A.abs_cnt_event, 
	abs_min_ambtemp = A.abs_min_ambtemp,
	abs_max_ambtemp = A.abs_max_ambtemp, 
	abs_avg_ambtemp = A.abs_avg_ambtemp, 
	abs_min_duration = A.abs_min_duration,
	abs_max_duration = A.abs_max_duration,
	abs_avg_duration = A.abs_avg_duration,
	abs_min_endspeed = A.abs_min_endspeed,
	abs_max_endspeed = A.abs_max_endspeed,
	abs_avg_endspeed = A.abs_avg_endspeed,
	abs_min_maxbrakepress = A.abs_min_maxbrakepress,
	abs_max_maxbrakepress = A.abs_max_maxbrakepress,
	abs_avg_maxbrakepress = A.abs_avg_maxbrakepress,
	abs_min_maxlatacc = A.abs_min_maxlatacc,
	abs_max_maxlatacc = A.abs_max_maxlatacc,
	abs_avg_maxlatacc = A.abs_avg_maxlatacc,
	abs_min_startspeed = A.abs_min_startspeed,
	abs_max_startspeed = A.abs_max_startspeed,
	abs_avg_startspeed = A.abs_avg_startspeed,
	abs_cnt_warnlampstatOff = A.abs_cnt_warnlampstatOff,
	abs_cnt_warnlampstatYellow = A.abs_cnt_warnlampstatYellow,
	abs_cnt_warnlampstatRed = A.abs_cnt_warnlampstatRed

FROM fcttripevents B
INNER JOIN 
(
select 
	B.TripId,
	A.itapudid, 
	A.accountid, 
	A.drivenum, 
	count(*) as abs_cnt_event,
	MIN(ambtemp) as abs_min_ambtemp, 
	MAX(ambtemp) as abs_max_ambtemp, 
	AVG(ambtemp) as abs_avg_ambtemp, 

	MIN(duration) as abs_min_duration, 
	MAX(duration) as abs_max_duration, 
	AVG(duration) as abs_avg_duration, 

		MIN(endspeed) as abs_min_endspeed, 
	MAX(endspeed) as abs_max_endspeed, 
	AVG(endspeed) as abs_avg_endspeed, 

		MIN(maxbrakepress) as abs_min_maxbrakepress, 
	MAX(maxbrakepress) as abs_max_maxbrakepress, 
	AVG(maxbrakepress) as abs_avg_maxbrakepress, 

		MIN(maxlatacc) as abs_min_maxlatacc, 
	MAX(maxlatacc) as abs_max_maxlatacc, 
	AVG(maxlatacc) as abs_avg_maxlatacc, 

		MIN(startspeed) as abs_min_startspeed, 
	MAX(startspeed) as abs_max_startspeed, 
	AVG(startspeed) as abs_avg_startspeed, 

	Sum(CASE WHEN a.warnlampstat = 0 then 1 else 0 end) as abs_cnt_warnlampstatOff,
	sum(CASE WHEN a.warnlampstat = 1 then 1 else 0 end) as abs_cnt_warnlampstatYellow,
	sum(CASE WHEN a.warnlampstat = 2 then 1 else 0 end) as abs_cnt_warnlampstatRed


from absevent A 
inner join DimTrip B
on A.accountid = B.Accountid
and A.itapudid = B.itapudid
AND A.drivenum between B.FirstDrivenum and B.LastDrivenum
GROUP BY 
	B.TripId,
	A.itapudid, 
	A.accountid, 
	A.drivenum
) A
ON A.TripId = B.tripId

;
UPDATE fcttripevents
set 
	async_cnt_event = A.async_cnt_event

FROM fcttripevents B
INNER JOIN 
(
select 
	B.TripId,
	A.itapudid, 
	A.accountid, 
	A.drivenum, 
	count(*) as async_cnt_event
from asyncevent A 
inner join DimTrip B
on A.accountid = B.Accountid
and A.itapudid = B.itapudid
AND A.drivenum between B.FirstDrivenum and B.LastDrivenum
GROUP BY 
	B.TripId,
	A.itapudid, 
	A.accountid, 
	A.drivenum
) A
ON A.TripId = B.tripId
;

UPDATE fcttripevents
set 
	brake_avg_long_acc_1to2bar = A.brake_avg_long_acc_1to2bar,
	brake_max_long_acc_1to2bar = A.brake_max_long_acc_1to2bar,
	brake_num_brake_app_1to2bar = A.brake_num_brake_app_1to2bar,
	brake_p_avg_brake_app_1to2bar = A.brake_p_avg_brake_app_1to2bar,
	brake_t_avg_brake_app_1to2bar = A.brake_t_avg_brake_app_1to2bar,
	brake_t_max_brake_app_1to2bar = A.brake_t_max_brake_app_1to2bar,
	brake_avg_long_acc_2to3bar = A.brake_avg_long_acc_2to3bar,
	brake_max_long_acc_2to3bar = A.brake_max_long_acc_2to3bar,
	brake_num_brake_app_2to3bar = A.brake_num_brake_app_2to3bar,
	brake_p_avg_brake_app_2to3bar = A.brake_p_avg_brake_app_2to3bar,
	brake_t_avg_brake_app_2to3bar = A.brake_t_avg_brake_app_2to3bar,
	brake_t_max_brake_app_2to3bar = A.brake_t_max_brake_app_2to3bar,
	brake_avg_long_acc_3to4bar = A.brake_avg_long_acc_3to4bar,
	brake_max_long_acc_3to4bar = A.brake_max_long_acc_3to4bar,
	brake_num_brake_app_3to4bar = A.brake_num_brake_app_3to4bar,
	brake_p_avg_brake_app_3to4bar = A.brake_p_avg_brake_app_3to4bar,
	brake_t_avg_brake_app_3to4bar = A.brake_t_avg_brake_app_3to4bar,
	brake_t_max_brake_app_3to4bar = A.brake_t_max_brake_app_3to4bar,
	brake_avg_long_acc_4to5bar = A.brake_avg_long_acc_4to5bar,
	brake_max_long_acc_4to5bar = A.brake_max_long_acc_4to5bar,
	brake_num_brake_app_4to5bar = A.brake_num_brake_app_4to5bar,
	brake_p_avg_brake_app_4to5bar = A.brake_p_avg_brake_app_4to5bar,
	brake_t_avg_brake_app_4to5bar = A.brake_t_avg_brake_app_4to5bar,
	brake_t_max_brake_app_4to5bar = A.brake_t_max_brake_app_4to5bar,
	brake_avg_long_acc_5to6bar = A.brake_avg_long_acc_5to6bar,
	brake_max_long_acc_5to6bar = A.brake_max_long_acc_5to6bar,
	brake_num_brake_app_5to6bar = A.brake_num_brake_app_5to6bar,
	brake_p_avg_brake_app_5to6bar = A.brake_p_avg_brake_app_5to6bar,
	brake_t_avg_brake_app_5to6bar = A.brake_t_avg_brake_app_5to6bar,
	brake_t_max_brake_app_5to6bar = A.brake_t_max_brake_app_5to6bar,
	brake_avg_long_acc_above6bar = A.brake_avg_long_acc_above6bar,
	brake_max_long_acc_above6bar = A.brake_max_long_acc_above6bar,
	brake_num_brake_app_above6bar = A.brake_num_brake_app_above6bar,
	brake_p_avg_brake_app_above6bar = A.brake_p_avg_brake_app_above6bar,
	brake_t_avg_brake_app_above6bar = A.brake_t_avg_brake_app_above6bar,
	brake_t_max_brake_app_above6bar = A.brake_t_max_brake_app_above6bar,
	brake_avg_long_acc_below1bar = A.brake_avg_long_acc_below1bar,
	brake_max_long_acc_below1bar = A.brake_max_long_acc_below1bar,
	brake_num_brake_app_below1bar  = A.brake_num_brake_app_below1bar,
	brake_p_avg_brake_app_below1bar = A.brake_p_avg_brake_app_below1bar,
	brake_t_avg_brake_app_below1bar = A.brake_t_avg_brake_app_below1bar,
	brake_t_max_brake_app_below1bar = A.brake_t_max_brake_app_below1bar,
	brake_avgload = A.brake_avgload,
	brake_avgspeed = A.brake_avgspeed,
	brake_maxload  = A.brake_maxload,
	brake_maxspeed = A.brake_maxspeed,
	brake_minload = A.brake_minload,
	brake_numvertaccband1 = A.brake_numvertaccband1,
	brake_numvertaccband2  = A.brake_numvertaccband2,
	brake_numvertaccband3 = A.brake_numvertaccband3,
	brake_numvertaccband4 = A.brake_numvertaccband4,
	brake_numvertaccband5 = A.brake_numvertaccband5,
	brake_numvertaccband6 = A.brake_numvertaccband6,
	brake_numvertaccband7 = A.brake_numvertaccband7,
	brake_tripdist = A.brake_tripdist

FROM fcttripevents B
INNER JOIN 
(
select 
	B.TripId,
	A.itapudid, 
	A.accountid, 
	A.drivenum, 
	avg_long_acc_1to2bar as brake_avg_long_acc_1to2bar,
	max_long_acc_1to2bar as brake_max_long_acc_1to2bar,
	num_brake_app_1to2bar as brake_num_brake_app_1to2bar,
	p_avg_brake_app_1to2bar as brake_p_avg_brake_app_1to2bar,
	t_avg_brake_app_1to2bar as brake_t_avg_brake_app_1to2bar,
	t_max_brake_app_1to2bar as brake_t_max_brake_app_1to2bar,
	avg_long_acc_2to3bar as brake_avg_long_acc_2to3bar,
	max_long_acc_2to3bar as brake_max_long_acc_2to3bar,
	num_brake_app_2to3bar as brake_num_brake_app_2to3bar,
	p_avg_brake_app_2to3bar as brake_p_avg_brake_app_2to3bar,
	t_avg_brake_app_2to3bar as brake_t_avg_brake_app_2to3bar,
	t_max_brake_app_2to3bar as brake_t_max_brake_app_2to3bar,
	avg_long_acc_3to4bar as brake_avg_long_acc_3to4bar,
	max_long_acc_3to4bar as brake_max_long_acc_3to4bar,
	num_brake_app_3to4bar as brake_num_brake_app_3to4bar,
	p_avg_brake_app_3to4bar as brake_p_avg_brake_app_3to4bar,
	t_avg_brake_app_3to4bar as brake_t_avg_brake_app_3to4bar,
	t_max_brake_app_3to4bar as brake_t_max_brake_app_3to4bar,
	avg_long_acc_4to5bar as brake_avg_long_acc_4to5bar,
	max_long_acc_4to5bar as brake_max_long_acc_4to5bar,
	num_brake_app_4to5bar as brake_num_brake_app_4to5bar,
	p_avg_brake_app_4to5bar as brake_p_avg_brake_app_4to5bar,
	t_avg_brake_app_4to5bar as brake_t_avg_brake_app_4to5bar,
	t_max_brake_app_4to5bar as brake_t_max_brake_app_4to5bar,
	avg_long_acc_5to6bar as brake_avg_long_acc_5to6bar,
	max_long_acc_5to6bar as brake_max_long_acc_5to6bar,
	num_brake_app_5to6bar as brake_num_brake_app_5to6bar,
	p_avg_brake_app_5to6bar as brake_p_avg_brake_app_5to6bar,
	t_avg_brake_app_5to6bar as brake_t_avg_brake_app_5to6bar,
	t_max_brake_app_5to6bar as brake_t_max_brake_app_5to6bar,
	avg_long_acc_above6bar as brake_avg_long_acc_above6bar,
	max_long_acc_above6bar as brake_max_long_acc_above6bar,
	num_brake_app_above6bar as brake_num_brake_app_above6bar,
	p_avg_brake_app_above6bar as brake_p_avg_brake_app_above6bar,
	t_avg_brake_app_above6bar as brake_t_avg_brake_app_above6bar,
	t_max_brake_app_above6bar as brake_t_max_brake_app_above6bar,
	avg_long_acc_below1bar as brake_avg_long_acc_below1bar,
	max_long_acc_below1bar as brake_max_long_acc_below1bar,
	num_brake_app_below1bar as brake_num_brake_app_below1bar,
	p_avg_brake_app_below1bar as brake_p_avg_brake_app_below1bar,
	t_avg_brake_app_below1bar as brake_t_avg_brake_app_below1bar,
	t_max_brake_app_below1bar as brake_t_max_brake_app_below1bar,
	avgload as brake_avgload,
	avgspeed as brake_avgspeed,
	maxload as brake_maxload,
	maxspeed as brake_maxspeed,
	minload as brake_minload,
	numvertaccband1 as brake_numvertaccband1,
	numvertaccband2 as brake_numvertaccband2,
	numvertaccband3 as brake_numvertaccband3,
	numvertaccband4 as brake_numvertaccband4,
	numvertaccband5 as brake_numvertaccband5,
	numvertaccband6 as brake_numvertaccband6,
	numvertaccband7 as brake_numvertaccband7,
	tripdist as brake_tripdist
from brakeconditionevent A 
inner join DimTrip B
on A.accountid = B.Accountid
and A.itapudid = B.itapudid
AND A.drivenum between B.FirstDrivenum and B.LastDrivenum

) A
ON A.TripId = B.tripId
;

UPDATE fcttripevents
set 
	dtc_cnt_event = A.dtc_cnt_event, 
	dtc_cnt_event0 = A.dtc_cnt_event0,
	dtc_cnt_event1 = A.dtc_cnt_event1,
	dtc_cnt_event2 = A.dtc_cnt_event2,
	dtc_cnt_event3 = A.dtc_cnt_event3


FROM fcttripevents B
INNER JOIN 
(
select 
	B.TripId,
	A.itapudid, 
	A.accountid, 
	A.drivenum, 
	sum(dtc_occur) as dtc_cnt_event,


	Sum(CASE WHEN a.dtc_severity = 0 then dtc_occur else 0 end) as dtc_cnt_event0,
	sum(CASE WHEN a.dtc_severity = 1 then dtc_occur else 0 end) as dtc_cnt_event1,
	sum(CASE WHEN a.dtc_severity = 2 then dtc_occur else 0 end) as dtc_cnt_event2,
	sum(CASE WHEN a.dtc_severity = 3 then dtc_occur else 0 end) as dtc_cnt_event3


from dtcevent A 
inner join DimTrip B
on A.accountid = B.Accountid
and A.itapudid = B.itapudid
AND A.drivenum between B.FirstDrivenum and B.LastDrivenum
GROUP BY 
	B.TripId,
	A.itapudid, 
	A.accountid, 
	A.drivenum
) A
ON A.TripId = B.tripId
;
UPDATE fcttripevents
set 
	gps_cnt_event = A.gps_cnt_event

FROM fcttripevents B
INNER JOIN 
(
select 
	B.TripId,
	A.itapudid, 
	A.accountid, 
	A.drivenum, 
	count(*) as gps_cnt_event
from gpstrackevent A 
inner join dimtrip B
on A.accountid = B.Accountid
and A.itapudid = B.itapudid
AND A.drivenum between B.FirstDrivenum and B.LastDrivenum
GROUP BY 
	B.TripId,
	A.itapudid, 
	A.accountid, 
	A.drivenum
) A
ON A.TripId = B.tripId

;



UPDATE fcttripevents
set 
	load_confmaxloadkg = A.load_confmaxloadkg,
	load_confminloadkg = A.load_confminloadkg,
	load_tripdistload100to110 = A.load_tripdistload100to110,
	load_tripdistload110to120 = A.load_tripdistload110to120,
	load_tripdistload120to130 = A.load_tripdistload120to130,
	load_tripdistload20t040 = A.load_tripdistload20t040,
	load_tripdistload40to60 = A.load_tripdistload40to60,
	load_tripdistload60to80 = A.load_tripdistload60to80,
	load_tripdistload80to100 = A.load_tripdistload80to100,
	load_tripdistloadabove130 = A.load_tripdistloadabove130,
	load_tripdistloadbelow20 = A.load_tripdistloadbelow20

FROM fcttripevents B
INNER JOIN 
(
select 
	B.TripId,
	A.itapudid, 
	A.accountid, 
	A.drivenum, 
	confmaxloadkg AS load_confmaxloadkg,
	confminloadkg AS load_confminloadkg,
	tripdistload100to110 AS load_tripdistload100to110,
	tripdistload110to120 AS load_tripdistload110to120,
	tripdistload120to130 AS load_tripdistload120to130,
	tripdistload20t040 AS load_tripdistload20t040,
	tripdistload40to60 AS load_tripdistload40to60,
	tripdistload60to80 AS load_tripdistload60to80,
	tripdistload80to100 AS load_tripdistload80to100,
	tripdistloadabove130 AS load_tripdistloadabove130,
	tripdistloadbelow20 AS load_tripdistloadbelow20
from loadevent A 
inner join dimtrip B
on A.accountid = B.Accountid
and A.itapudid = B.itapudid
AND A.drivenum between B.FirstDrivenum and B.LastDrivenum

) A
ON A.TripId = B.tripId

;


UPDATE fcttripevents
set 
	lshock_cnt_event = A.lshock_cnt_event,
	lshock_avg_forwrevgear = A.lshock_avg_forwrevgear, 
	lshock_min_forwrevgear = A.lshock_min_forwrevgear,
	lshock_max_forwrevgear = A.lshock_max_forwrevgear, 
	lshock_avg_longacc = A.lshock_avg_longacc, 
	lshock_min_longacc = A.lshock_min_longacc,
	lshock_max_longacc = A.lshock_max_longacc

FROM fcttripevents B
INNER JOIN 
(
select 
	B.TripId,
	A.itapudid, 
	A.accountid, 
	A.drivenum, 
	count(*) as lshock_cnt_event,
	MIN(forwrevgear) as lshock_min_forwrevgear, 
	MAX(forwrevgear) as lshock_max_forwrevgear, 
	AVG(forwrevgear) as lshock_avg_forwrevgear, 

	MIN(longacc) as lshock_min_longacc, 
	MAX(longacc) as lshock_max_longacc, 
	AVG(longacc) as lshock_avg_longacc
from longitudinalshockevent A 
inner join dimtrip B
on A.accountid = B.Accountid
and A.itapudid = B.itapudid
AND A.drivenum between B.FirstDrivenum and B.LastDrivenum
GROUP BY 
	B.TripId,
	A.itapudid, 
	A.accountid, 
	A.drivenum
) A
ON A.TripId = B.tripId
;

UPDATE fcttripevents
set 
	off_avgload = A.off_avgload,
	off_avgspeed = A.off_avgspeed,
	off_max1stdetectwssa = A.off_max1stdetectwssa,
	off_max1stdetectwssb = A.off_max1stdetectwssb,
	off_max1stdetectwssc = A.off_max1stdetectwssc,
	off_max1stdetectwssd = A.off_max1stdetectwssd,
	off_max1stdetectwsse = A.off_max1stdetectwsse,
	off_max1stdetectwssf = A.off_max1stdetectwssf,
	off_maxlatacc = A.off_maxlatacc,
	off_maxload = A.off_maxload,
	off_maxlongacc = A.off_maxlongacc,
	off_maxp1presstrip = A.off_maxp1presstrip,
	off_maxspeed = A.off_maxspeed,
	off_minload = A.off_minload,
	off_minp1presstrip = A.off_minp1presstrip,
	off_p1presspoweroff = A.off_p1presspoweroff,
	off_padwearstat = A.off_padwearstat,
	off_totaldist = A.off_totaldist,
	off_tripdist = A.off_tripdist
FROM fcttripevents B
INNER JOIN 
(
select 
	B.TripId,
	A.itapudid, 
	A.accountid, 
	A.drivenum, 
	avgload as off_avgload,
	avgspeed as off_avgspeed,
	max1stdetectwssa as off_max1stdetectwssa,
	max1stdetectwssb as off_max1stdetectwssb,
	max1stdetectwssc as off_max1stdetectwssc,
	max1stdetectwssd as off_max1stdetectwssd,
	max1stdetectwsse as off_max1stdetectwsse,
	max1stdetectwssf as off_max1stdetectwssf,
	maxlatacc as off_maxlatacc,
	maxload as off_maxload,
	maxlongacc as off_maxlongacc,
	maxp1presstrip as off_maxp1presstrip,
	maxspeed as off_maxspeed,
	minload as off_minload,
	minp1presstrip as off_minp1presstrip,
	p1presspoweroff as off_p1presspoweroff,
	padwearstat as off_padwearstat,
	totaldist as off_totaldist,
	tripdist as off_tripdist
from poweroffevent A 
inner join dimtrip B
on A.accountid = B.Accountid
and A.itapudid = B.itapudid
AND A.drivenum between B.FirstDrivenum and B.LastDrivenum

) A
ON A.TripId = B.tripId

;

	UPDATE fcttripevents
set 
	offsl_avg_maxlatacc = A.offsl_avg_maxlatacc,
	offsl_min_maxlatacc = A.offsl_min_maxlatacc, 
	offsl_max_maxlatacc = A.offsl_max_maxlatacc,
	offsl_avg_maxlongacc = A.offsl_avg_maxlongacc, 
	offsl_min_maxlongacc = A.offsl_min_maxlongacc, 
	offsl_max_maxlongacc = A.offsl_max_maxlongacc,
	offsl_avg_maxspeed = A.offsl_avg_maxspeed,
	offsl_min_maxspeed = A.offsl_min_maxspeed,
	offsl_max_maxspeed = A.offsl_max_maxspeed,
	offsl_avg_minspeed = A.offsl_avg_minspeed,
	offsl_min_minspeed = A.offsl_min_minspeed,
	offsl_max_minspeed = A.offsl_max_minspeed,
	offsl_avg_p1presspoweroff = A.offsl_avg_p1presspoweroff,
	offsl_min_p1presspoweroff = A.offsl_min_p1presspoweroff,
	offsl_max_p1presspoweroff = A.offsl_max_p1presspoweroff,
	offsl_avg_tpowercycle = A.offsl_avg_tpowercycle,
	offsl_min_tpowercycle = A.offsl_min_tpowercycle,
	offsl_max_tpowercycle = A.offsl_max_tpowercycle

FROM fcttripevents B
INNER JOIN 
(
select 
	B.TripId,
	A.itapudid, 
	A.accountid, 
	A.drivenum, 
	AVG(maxlatacc) as offsl_avg_maxlatacc, 
	MIN(maxlatacc) as offsl_min_maxlatacc, 
	MAX(maxlatacc) as offsl_max_maxlatacc, 
	AVG(maxlongacc) as offsl_avg_maxlongacc, 
	MIN(maxlongacc) as offsl_min_maxlongacc, 
	MAX(maxlongacc) as offsl_max_maxlongacc,
	AVG(maxspeed) as offsl_avg_maxspeed,
	MIN(maxspeed) as offsl_min_maxspeed,
	MAX(maxspeed) as offsl_max_maxspeed,
	AVG(minspeed) as offsl_avg_minspeed,
	MIN(minspeed) as offsl_min_minspeed,
	MAX(minspeed) as offsl_max_minspeed,
	AVG(p1presspoweroff) as offsl_avg_p1presspoweroff,
	MIN(p1presspoweroff) as offsl_min_p1presspoweroff,
	MAX(p1presspoweroff) as offsl_max_p1presspoweroff,
	AVG(tpowercycle) as offsl_avg_tpowercycle,
	MIN(tpowercycle) as offsl_min_tpowercycle,
	MAX(tpowercycle) as offsl_max_tpowercycle


from poweroffslevent A 
inner join dimtrip B
on A.accountid = B.Accountid
and A.itapudid = B.itapudid
AND A.drivenum between B.FirstDrivenum and B.LastDrivenum
GROUP BY 
	B.TripId,
	A.itapudid, 
	A.accountid, 
	A.drivenum
) A
ON A.TripId = B.tripId

;
UPDATE fcttripevents
set 

	on_p1presspoweron = A.on_p1presspoweron
FROM fcttripevents B
INNER JOIN 
(
select 
	B.TripId,
	A.itapudid, 
	A.accountid, 
	A.drivenum, 
	p1presspoweron as on_p1presspoweron
from poweronevent A 
inner join dimtrip B
on A.accountid = B.Accountid
and A.itapudid = B.itapudid
AND A.drivenum between B.FirstDrivenum and B.LastDrivenum

) A
ON A.TripId = B.tripId
;

	UPDATE fcttripevents
set 
	rsp_cnt_event = A.rsp_cnt_event, 
	rsp_avg_duration = A.rsp_avg_duration,
	rsp_min_duration = A.rsp_min_duration, 
	rsp_max_duration = A.rsp_max_duration, 
	rsp_avg_endspeed = A.rsp_avg_endspeed,
	rsp_min_endspeed = A.rsp_min_endspeed,
	rsp_max_endspeed = A.rsp_max_endspeed,
	rsp_avg_maxbrakepress = A.rsp_avg_maxbrakepress,
	rsp_min_maxbrakepress = A.rsp_min_maxbrakepress,
	rsp_max_maxbrakepress = A.rsp_max_maxbrakepress,
	rsp_avg_maxlatacc = A.rsp_avg_maxlatacc,
	rsp_min_maxlatacc = A.rsp_min_maxlatacc,
	rsp_max_maxlatacc = A.rsp_max_maxlatacc,
	rsp_avg_maxlongacc = A.rsp_avg_maxlongacc,
	rsp_min_maxlongacc = A.rsp_min_maxlongacc,
	rsp_max_maxlongacc = A.rsp_max_maxlongacc,
	rsp_avg_startspeed = A.rsp_avg_startspeed,
	rsp_min_startspeed = A.rsp_min_startspeed,
	rsp_max_startspeed = A.rsp_max_startspeed,
	rsp_cnt_warnlampstatOff = A.rsp_cnt_warnlampstatOff,
	rsp_cnt_warnlampstatYellow = A.rsp_cnt_warnlampstatYellow,
	rsp_cnt_warnlampstatRed = A.rsp_cnt_warnlampstatRed

FROM fcttripevents B
INNER JOIN 
(
select 
	B.TripId,
	A.itapudid, 
	A.accountid, 
	A.drivenum, 
	count(*) as rsp_cnt_event,
	AVG(duration) as rsp_avg_duration, 
	MIN(duration) as rsp_min_duration, 
	MAX(duration) as rsp_max_duration, 

	AVG(endspeed) as rsp_avg_endspeed, 
	MIN(endspeed) as rsp_min_endspeed, 
	MAX(endspeed) as rsp_max_endspeed, 

		AVG(maxbrakepress) as rsp_avg_maxbrakepress, 
	MIN(maxbrakepress) as rsp_min_maxbrakepress, 
	MAX(maxbrakepress) as rsp_max_maxbrakepress, 

		AVG(maxlatacc) as rsp_avg_maxlatacc, 
	MIN(maxlatacc) as rsp_min_maxlatacc, 
	MAX(maxlatacc) as rsp_max_maxlatacc, 

		AVG(maxlongacc) as rsp_avg_maxlongacc, 
	MIN(maxlongacc) as rsp_min_maxlongacc, 
	MAX(maxlongacc) as rsp_max_maxlongacc, 

		AVG(startspeed) as rsp_avg_startspeed, 
	MIN(startspeed) as rsp_min_startspeed, 
	MAX(startspeed) as rsp_max_startspeed, 

	Sum(CASE WHEN a.warnlampstat = 0 then 1 else 0 end) as rsp_cnt_warnlampstatOff,
	sum(CASE WHEN a.warnlampstat = 1 then 1 else 0 end) as rsp_cnt_warnlampstatYellow,
	sum(CASE WHEN a.warnlampstat = 2 then 1 else 0 end) as rsp_cnt_warnlampstatRed


from rspevent A 
inner join dimtrip B
on A.accountid = B.Accountid
and A.itapudid = B.itapudid
AND A.drivenum between B.FirstDrivenum and B.LastDrivenum
GROUP BY 
	B.TripId,
	A.itapudid, 
	A.accountid, 
	A.drivenum
) A
ON A.TripId = B.tripId
;
UPDATE fcttripevents
set 
	tebs_cnt_event = A.tebs_cnt_event, 
	tebs_cnt_event0 = A.tebs_cnt_event0,
	tebs_cnt_event1 = A.tebs_cnt_event1,
	tebs_cnt_event2 = A.tebs_cnt_event2,
	tpms_cnt_event = A.tpms_cnt_event, 
	tpms_cnt_event0 = A.tpms_cnt_event0,
	tpms_cnt_event1 = A.tpms_cnt_event1,
	tpms_cnt_event2 = A.tpms_cnt_event2

FROM fcttripevents B
INNER JOIN 
(
select 
	B.TripId,
	A.itapudid, 
	A.accountid, 
	A.drivenum, 
	sum(case when tebsstat is not null then 1 else null end) as tebs_cnt_event,
	Sum(CASE WHEN a.tebsstat = 0 then 1 when a.tebsstat is not null then 0 else null end) as tebs_cnt_event0,
	sum(CASE WHEN a.tebsstat = 1 then 1 when a.tebsstat is not null then 0 else null end) as tebs_cnt_event1,
	sum(CASE WHEN a.tebsstat = 2 then 1 when a.tebsstat is not null then 0 else null end) as tebs_cnt_event2,
	sum(case when tpmsstat is not null then 1 else null end) as tpms_cnt_event,
	Sum(CASE WHEN a.tpmsstat = 0 then 1 when a.tpmsstat is not null then 0 else null end) as tpms_cnt_event0,
	sum(CASE WHEN a.tpmsstat = 1 then 1 when a.tpmsstat is not null then 0 else null end) as tpms_cnt_event1,
	sum(CASE WHEN a.tpmsstat = 2 then 1 when a.tpmsstat is not null then 0 else null end) as tpms_cnt_event2


from statusevent A 
inner join dimtrip B
on A.accountid = B.Accountid
and A.itapudid = B.itapudid
AND A.drivenum between B.FirstDrivenum and B.LastDrivenum
GROUP BY 
	B.TripId,
	A.itapudid, 
	A.accountid, 
	A.drivenum
) A
ON A.TripId = B.tripId
;
UPDATE fcttripevents
set 
	vshock_cnt_event = A.vshock_cnt_event,
	vshock_avg_forwrevgear = A.vshock_avg_forwrevgear, 
	vshock_min_forwrevgear = A.vshock_min_forwrevgear,
	vshock_max_forwrevgear = A.vshock_max_forwrevgear, 
	vshock_avg_vertacc = A.vshock_avg_vertacc, 
	vshock_min_vertacc = A.vshock_min_vertacc,
	vshock_max_vertacc = A.vshock_max_vertacc

FROM fcttripevents B
INNER JOIN 
(
select 
	B.TripId,
	A.itapudid, 
	A.accountid, 
	A.drivenum, 
	count(*) as vshock_cnt_event,
	MIN(forwrevgear) as vshock_min_forwrevgear, 
	MAX(forwrevgear) as vshock_max_forwrevgear, 
	AVG(forwrevgear) as vshock_avg_forwrevgear, 

	MIN(vertacc) as vshock_min_vertacc, 
	MAX(vertacc) as vshock_max_vertacc, 
	AVG(vertacc) as vshock_avg_vertacc
from verticalshockevent A 
inner join dimtrip B
on A.accountid = B.Accountid
and A.itapudid = B.itapudid
AND A.drivenum between B.FirstDrivenum and B.LastDrivenum
GROUP BY 
	B.TripId,
	A.itapudid, 
	A.accountid, 
	A.drivenum
) A
ON A.TripId = B.tripId
;