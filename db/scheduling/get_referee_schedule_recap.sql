select sid, name, color, start_time as start,
to_char( start_time AT TIME ZONE (select time_zone from tournament where tid = ${tid}), 'Dy MM/DD HH:MI am') as start_time,
to_char( end_time AT TIME ZONE (select time_zone from tournament where tid = ${tid}), 'HH:MI am') as end_time,

spots, wait_spots,
(select count(*) from shift_spots where s.sid = sid and waitlist = false) as taken,
(select count(*) from shift_spots where s.sid = sid and waitlist = true) as waitlist
from shift s 
where tid = ${tid}
and category = 'Referee' 
order by start, name;