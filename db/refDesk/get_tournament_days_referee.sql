select 
distinct(start_time at time zone 'utc' at time zone (select time_zone from tournament where tid = ${tid}))::date as start_time,

to_char( start_time  at time zone 'utc' at time zone (select time_zone from tournament where tid = ${tid}), 'DY MM/DD/YYYY') as day,
to_char( start_time  at time zone 'utc' at time zone (select time_zone from tournament where tid = ${tid}), 'DY MM/DD') as day_display

from court_assignments t
where tid = ${tid} and t.start_time is not null
group by t.start_time;