update courts
set line_group = ${gid}
where tournament_id = ${tid} and court_num = ${court_num};

update line_groups
    set court_num = ${court_num},
    start = now(),
    finished = null
where gid = ${gid};

select to_char((now() AT TIME ZONE (select time_zone from tournament where tid = ${tid})), 'MM/DD HH12:MI am') as time
from tournament where tid = ${tid};

