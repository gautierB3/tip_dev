SELECT dimtrip.itapudid, "LastChangeDate"

FROM dimtrip 

LEFT JOIN poweroffslevent
	ON dimtrip.itapudid = poweroffslevent.itapudid 

;
