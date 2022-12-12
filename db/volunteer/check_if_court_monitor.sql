select distinct(v.tid) 
from volunteer_signup v 
left join shift_spots ss 
on ss.ref_id = v.ref_id and ss.tid = v.tid
left join shift s 
on ss.sid = s.sid
left join volunteer_category vc 
on vc.vcid = s.vcid

where v.tid = ${tid} and v.ref_id = ${ref_id}
and status = true 
and vc.court_monitor = true;