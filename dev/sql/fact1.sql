




-- Seledt tripId and dateID

-- TODO: lastchangedate is related to device??


-- SELECT DISTINCT tripid, COALESCE(tripstarttime, tripendtime) 
SELECT DISTINCT tripid, COALESCE(tripstarttime, tripendtime) as date_coalesce
from dimtrip
;