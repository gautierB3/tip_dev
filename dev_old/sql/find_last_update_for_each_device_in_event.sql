SELECT itapudid, to_timestamp(cast(max(max) as BIGINT)) as last_update FROM

	(SELECT itapudid, max(eventtime)
	FROM absevent
	GROUP BY itapudid

	UNION

	SELECT itapudid, max(eventtime) 
	FROM asyncevent
	GROUP BY itapudid

	UNION

	SELECT itapudid, max(eventtime) 
	FROM brakeconditionevent
	GROUP BY itapudid

	UNION

	SELECT itapudid, max(eventtime) 
	FROM dtcevent
	GROUP BY itapudid

	UNION

	SELECT itapudid, max(eventtime) 
	FROM ebschangeevent
	GROUP BY itapudid

	UNION

	SELECT itapudid, max(eventtime) 
	FROM gpstrackevent
	GROUP BY itapudid

	UNION

	SELECT itapudid, max(eventtime) 
	FROM internalstatusevent
	GROUP BY itapudid

	UNION

	SELECT itapudid, max(eventtime) 
	FROM loadevent
	GROUP BY itapudid

	UNION

	SELECT itapudid, max(eventtime) 
	FROM longitudinalshockevent
	GROUP BY itapudid

	UNION

	SELECT itapudid, max(eventtime) 
	FROM poweroffevent
	GROUP BY itapudid

	UNION

	SELECT itapudid, max(eventtime) 
	FROM poweroffslevent
	GROUP BY itapudid

	UNION

	SELECT itapudid, max(eventtime) 
	FROM poweronevent
	GROUP BY itapudid

	UNION

	SELECT itapudid, max(eventtime) 
	FROM rspevent
	GROUP BY itapudid

	UNION

	SELECT itapudid, max(eventtime) 
	FROM statusevent
	GROUP BY itapudid

	UNION

	SELECT itapudid, max(eventtime) 
	FROM tmpsevent
	GROUP BY itapudid

	UNION

	SELECT itapudid, max(eventtime) 
	FROM verticalshockevent
	GROUP BY itapudid
) as itapudid
GROUP BY itapudid
;