select rsid, shift_id, ss.ref_id, first || ' '|| last as name, 
COALESCE(status, false) as checkin, shirt_pickup,
to_char((s.start_time  AT TIME ZONE (select time_zone from tournament where tid = ${tid})), 'MM/DD HH12:MI am') as start_time,
to_char((s.end_time AT TIME ZONE (select time_zone from tournament where tid = ${tid})), 'HH12:MI am') as end_time, 
COALESCE(s.name, '')as shift, color, 
COALESCE((select name from volunteer_category where vcid = s.vcid ) , '')as category,
 shirt || ' / '|| shirt2 as shirt
from shift_spots ss 
left join shift s
on s.sid = ss.sid
left join referee r 
on r.ref_id = ss.ref_id
left join volunteer_signup vs 
on ss.ref_id = vs.ref_id and vs.tid = ${tid}
where s.tid = ${tid} 
and (s.start_time at time zone (select time_zone from tournament where tid = ${tid}))::date = ${day}
order by s.start_time, last, first