
DROP TABLE IF EXISTS fcttripevents;

CREATE TABLE fcttripevents(
 	tripId int NOT NULL,
	date_coalesce timestamp NOT NULL, 
	
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
	vshock_max_vertacc int NULL
);

INSERT INTO fcttripevents (TripId, date_coalesce)
SELECT DISTINCT tripid, COALESCE(tripstarttime, tripendtime)
from dimtrip
;

-- update 3


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
	B.tripId,
	A.itapudid, 
	A.accountid, 
	A.drivenum, 
	cast(avg(avg_long_acc_1to2bar) as smallint) as brake_avg_long_acc_1to2bar,
	cast(max(max_long_acc_1to2bar) as smallint) as brake_max_long_acc_1to2bar,
	cast(sum(num_brake_app_1to2bar) as smallint) as brake_num_brake_app_1to2bar,
	cast(avg(p_avg_brake_app_1to2bar) as smallint) as brake_p_avg_brake_app_1to2bar,
	cast(avg(t_avg_brake_app_1to2bar) as smallint) as brake_t_avg_brake_app_1to2bar,
	cast(max(t_max_brake_app_1to2bar) as smallint) as brake_t_max_brake_app_1to2bar,
	cast(avg(avg_long_acc_2to3bar) as smallint) as brake_avg_long_acc_2to3bar,
	cast(max(max_long_acc_2to3bar) as smallint) as brake_max_long_acc_2to3bar,
	cast(sum(num_brake_app_2to3bar) as smallint) as brake_num_brake_app_2to3bar,
	cast(avg(p_avg_brake_app_2to3bar) as smallint) as brake_p_avg_brake_app_2to3bar,
	cast(avg(t_avg_brake_app_2to3bar) as smallint) as brake_t_avg_brake_app_2to3bar,
	cast(max(t_max_brake_app_2to3bar) as smallint) as brake_t_max_brake_app_2to3bar,
	cast(avg(avg_long_acc_3to4bar) as smallint) as brake_avg_long_acc_3to4bar,
	cast(max(max_long_acc_3to4bar) as smallint) as brake_max_long_acc_3to4bar,
	cast(sum(num_brake_app_3to4bar) as smallint) as brake_num_brake_app_3to4bar,
	cast(avg(p_avg_brake_app_3to4bar) as smallint) as brake_p_avg_brake_app_3to4bar,
	cast(avg(t_avg_brake_app_3to4bar) as smallint) as brake_t_avg_brake_app_3to4bar,
	cast(max(t_max_brake_app_3to4bar) as smallint) as brake_t_max_brake_app_3to4bar,
	cast(avg(avg_long_acc_4to5bar) as smallint) as brake_avg_long_acc_4to5bar,
	cast(max(max_long_acc_4to5bar) as smallint) as brake_max_long_acc_4to5bar,
	cast(sum(num_brake_app_4to5bar) as smallint) as brake_num_brake_app_4to5bar,
	cast(avg(p_avg_brake_app_4to5bar) as smallint) as brake_p_avg_brake_app_4to5bar,
	cast(avg(t_avg_brake_app_4to5bar) as smallint) as brake_t_avg_brake_app_4to5bar,
	cast(max(t_max_brake_app_4to5bar) as smallint) as brake_t_max_brake_app_4to5bar,
	cast(avg(avg_long_acc_5to6bar) as smallint) as brake_avg_long_acc_5to6bar,
	cast(max(max_long_acc_5to6bar) as smallint) as brake_max_long_acc_5to6bar,
	cast(sum(num_brake_app_5to6bar) as smallint) as brake_num_brake_app_5to6bar,
	cast(avg(p_avg_brake_app_5to6bar) as smallint) as brake_p_avg_brake_app_5to6bar,
	cast(avg(t_avg_brake_app_5to6bar) as smallint) as brake_t_avg_brake_app_5to6bar,
	cast(max(t_max_brake_app_5to6bar) as smallint) as brake_t_max_brake_app_5to6bar,
	cast(avg(avg_long_acc_above6bar) as smallint) as brake_avg_long_acc_above6bar,
	cast(max(max_long_acc_above6bar) as smallint) as brake_max_long_acc_above6bar,
	cast(sum(num_brake_app_above6bar) as smallint) as brake_num_brake_app_above6bar,
	cast(avg(p_avg_brake_app_above6bar) as smallint) as brake_p_avg_brake_app_above6bar,
	cast(avg(t_avg_brake_app_above6bar) as smallint) as brake_t_avg_brake_app_above6bar,
	cast(max(t_max_brake_app_above6bar) as smallint) as brake_t_max_brake_app_above6bar,
	cast(avg(avg_long_acc_below1bar) as smallint) as brake_avg_long_acc_below1bar,
	cast(max(max_long_acc_below1bar) as smallint) as brake_max_long_acc_below1bar,
	cast(sum(num_brake_app_below1bar) as smallint) as brake_num_brake_app_below1bar,
	cast(avg(p_avg_brake_app_below1bar) as smallint) as brake_p_avg_brake_app_below1bar,
	cast(avg(t_avg_brake_app_below1bar) as smallint) as brake_t_avg_brake_app_below1bar,
	cast(max(t_max_brake_app_below1bar) as smallint) as brake_t_max_brake_app_below1bar,
	cast(avg(avgload) as bigint) as brake_avgload,
	cast(avg(avgspeed) as integer) as brake_avgspeed,
	cast(max(maxload) as bigint) as brake_maxload,
	cast(max(maxspeed) as integer) as brake_maxspeed,
	cast(min(minload) as bigint) as brake_minload,
	cast(sum(numvertaccband1) as bigint) as brake_numvertaccband1,
	cast(sum(numvertaccband2) as bigint) as brake_numvertaccband2,
	cast(sum(numvertaccband3) as bigint) as brake_numvertaccband3,
	cast(sum(numvertaccband4) as bigint) as brake_numvertaccband4,
	cast(sum(numvertaccband5) as bigint) as brake_numvertaccband5,
	cast(sum(numvertaccband6) as bigint) as brake_numvertaccband6,
	cast(sum(numvertaccband7) as bigint) as brake_numvertaccband7,
	cast(sum(tripdist) as integer) as brake_tripdist
from brakeconditionevent A 
inner join DimTrip B
on A.accountid = B.Accountid
and A.itapudid = B.itapudid
AND A.drivenum between B.FirstDrivenum and B.LastDrivenum
GROUP BY
	B.tripId,
	A.itapudid, 
	A.accountid, 
	A.drivenum

) A
ON A.tripId = B.tripId
;

-- update 4
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
	B.tripId,
	A.itapudid, 
	A.accountid, 
	A.drivenum, 
	cast(sum(dtc_occur) as integer) as dtc_cnt_event,


	cast(Sum(CASE WHEN a.dtc_severity = 0 then dtc_occur else 0 end) as integer) as dtc_cnt_event0,
	cast(sum(CASE WHEN a.dtc_severity = 1 then dtc_occur else 0 end) as integer) as dtc_cnt_event1,
	cast(sum(CASE WHEN a.dtc_severity = 2 then dtc_occur else 0 end) as integer) as dtc_cnt_event2,
	cast(sum(CASE WHEN a.dtc_severity = 3 then dtc_occur else 0 end) as integer) as dtc_cnt_event3


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
ON A.tripId = B.tripId
;

-- update 6
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
	B.tripId,
	A.itapudid, 
	A.accountid, 
	A.drivenum, 
	CAST(max(confmaxloadkg) as BIGINT) AS load_confmaxloadkg,
	CAST(min(confminloadkg) as BIGINT) AS load_confminloadkg,
	CAST(sum(tripdistload100to110) AS INTEGER) AS load_tripdistload100to110,
	CAST(sum(tripdistload110to120) AS INTEGER) AS load_tripdistload110to120,
	CAST(sum(tripdistload120to130) AS INTEGER) AS load_tripdistload120to130,
	CAST(sum(tripdistload20t040) AS INTEGER) AS load_tripdistload20t040,
	CAST(sum(tripdistload40to60) AS INTEGER) AS load_tripdistload40to60,
	CAST(sum(tripdistload60to80) AS INTEGER) AS load_tripdistload60to80,
	CAST(sum(tripdistload80to100) AS INTEGER) AS load_tripdistload80to100,
	CAST(sum(tripdistloadabove130) AS INTEGER) AS load_tripdistloadabove130,
	CAST(sum(tripdistloadbelow20) AS INTEGER) AS load_tripdistloadbelow20
from loadevent A 
inner join dimtrip B
on A.accountid = B.Accountid
and A.itapudid = B.itapudid
AND A.drivenum between B.FirstDrivenum and B.LastDrivenum
group BY
	B.tripId,
	A.itapudid, 
	A.accountid, 
	A.drivenum


) A
ON A.tripId = B.tripId

;


-- update 8
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
	/*off_padwearstat = A.off_padwearstat,*/
	off_totaldist = A.off_totaldist,
	off_tripdist = A.off_tripdist
FROM fcttripevents B
INNER JOIN 
(
-- memory error

select 
	B.TripId,
	A.itapudid, 
	A.accountid, 
	A.drivenum, 
	CAST(avg(avgload) as bigint) as off_avgload,
	CAST(avg(avgspeed) as integer) as off_avgspeed,
	CAST(max(max1stdetectwssa) as integer) as off_max1stdetectwssa,
	CAST(max(max1stdetectwssb) as integer) as off_max1stdetectwssb,
	CAST(max(max1stdetectwssc) as integer) as off_max1stdetectwssc,
	CAST(max(max1stdetectwssd) as integer) as off_max1stdetectwssd,
	CAST(max(max1stdetectwsse) as integer) as off_max1stdetectwsse,
	CAST(max(max1stdetectwssf) as integer) as off_max1stdetectwssf,
	CAST(max(maxlatacc) as integer) as off_maxlatacc,
	CAST(max(maxload) as bigint) as off_maxload,
	CAST(max(maxlongacc) as integer) as off_maxlongacc,
	CAST(max(maxp1presstrip) as integer) as off_maxp1presstrip,
	CAST(max(maxspeed) as integer) as off_maxspeed,
	CAST(max(minload) as bigint) as off_minload,
	CAST(min(minp1presstrip) as integer) as off_minp1presstrip,
	CAST(avg(p1presspoweroff) as integer) as off_p1presspoweroff,
	/*padwearstat as off_padwearstat,*/
	CAST(sum(totaldist) as bigint) as off_totaldist,
	CAST(sum(tripdist) as integer) as off_tripdist
from poweroffevent A 
inner join dimtrip B
on A.accountid = B.Accountid
and A.itapudid = B.itapudid
AND A.drivenum between B.FirstDrivenum and B.LastDrivenum

GROUP BY
B.TripId,
A.itapudid,
a.accountid,
a.drivenum

) A
ON A.TripId = B.tripId

;