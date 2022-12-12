select DISTINCT(monitor_id), first, last, v.status
from courts c
left join referee r
on r.ref_id = c.monitor_id
left join volunteer_signup v
on r.ref_id = v.ref_id
where tournament_id = ${tid};