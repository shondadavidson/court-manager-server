select 
COALESCE(
to_char( start_time AT TIME ZONE (select time_zone from tournament where tid = s.tid), 'Dy MM/DD HH:MI am') || ' - ' || to_char( end_time AT TIME ZONE (select time_zone from tournament where tid = s.tid), 'HH:MI am'), '') as start,

* from shift s 
where tid = ${tid} and category = 'Referee'
order by category desc, date, start_time, name;