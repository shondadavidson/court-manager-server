select s.sid, t.name as tournament, COALESCE(
to_char( start_time AT TIME ZONE (select time_zone from tournament where tid = s.tid), 'Dy MM/DD HH:MI am'), '') as start,
COALESCE(
to_char( end_time AT TIME ZONE (select time_zone from tournament where tid = s.tid), 'HH:MI am'), '') as end, waitlist
from shift_spots ss 
left join shift s 
on ss.sid = s.sid
left join tournament t 
on t.tid = ss.tid
where 
(
(select start_time from shift where sid = ${sid}) = s.start_time)
 and ss.ref_id = ${ref_id} 
 and s.sid != ${sid} and captain = false
;