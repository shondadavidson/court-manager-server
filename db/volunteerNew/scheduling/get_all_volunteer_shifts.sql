select sid, COALESCE(s.name, '') as name, 
start_time, end_time,
COALESCE(
to_char( start_time AT TIME ZONE (select time_zone from tournament where tid = s.tid), 'Dy MM/DD HH:MI am'), '') as start,
COALESCE(
to_char( end_time AT TIME ZONE (select time_zone from tournament where tid = s.tid), 'MM/DD HH:MI am'), '') as end,
 spots, wait_spots, pre_reg, color,
COALESCE(c.name, '-') as category, s.vcid, 
(select count(*) from shift_spots where sid = s.sid and waitlist = false) as spot_count,
(select count(*) from shift_spots where sid = s.sid and waitlist = true) as wait_count
from shift s 
left join volunteer_category c 
on s.vcid = c.vcid
where s.tid = ${tid} and category = 'other'
order by c.name, s.name, start_time;