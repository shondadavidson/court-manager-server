select distinct(ss.ref_id), first, last, vs.status
from shift s 
left join shift_spots ss 
on s.sid = ss.sid 
left join referee r 
on r.ref_id = ss.ref_id
left join volunteer_signup vs 
on vs.ref_id = r.ref_id

where s.tid = ${tid} and vs.status = true
and (select court_monitor from volunteer_category where vcid = s.vcid) = true
order by last, first;