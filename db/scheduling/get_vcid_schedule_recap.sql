select sid, name, color, spots, wait_spots,
(select count(*) from shift_spots where s.sid = sid and waitlist = false) as taken,
(select count(*) from shift_spots where s.sid = sid and waitlist = true) as waitlist,
to_char((start_time AT TIME ZONE (select time_zone from tournament where tid = s.tid)), 'MM/DD HH12:MI am') as start_time,
start_time as start,
to_char((end_time AT TIME ZONE (select time_zone from tournament where tid = s.tid)), 'HH12:MI am') as end_time
from shift s 
where vcid = ${vcid}
order by vcid, name, start;