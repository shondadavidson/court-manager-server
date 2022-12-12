select id, first || ' ' || last as name, start_time, end_time,
to_char((start_time at time zone 'utc' AT TIME ZONE (select time_zone from tournament where tid = m.tid)), 'MM/DD HH12:MI am') as start,
to_char((end_time at time zone 'utc' AT TIME ZONE (select time_zone from tournament where tid = m.tid)), 'HH12:MI am') as end,
minutes
from match_starter m 
left join referee r 
on r.ref_id = m.ref_id 
where tid = ${tid}
order by id desc;