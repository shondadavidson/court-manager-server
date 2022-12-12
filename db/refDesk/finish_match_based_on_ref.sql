update line_groups
    set court_num = null, 
start = null,
finished = now()
where court_num = ${court_num} and tid = ${tid};

update line_signup
    set court_num = null
    where court_num = ${cn} and tid = ${tid};

update line_assignments 
    set end_time = now(), 
    on_court = false,
    sysid = ${sysid},
    medal = ${medal},
    forfeit = ${forfeit}
    where id = ${id};

update line_assignments
    set end_time = now(),
    match_id = ${id},
    match_time  =   (SELECT (DATE_PART('day', (select end_time) - (select start_time)) * 24 + 
              DATE_PART('hour', (select end_time) - (select start_time) )) * 60 +
              DATE_PART('minute', (select end_time) - (select start_time)) )
    where tid = ${tid} and court_num = ${court_num} and end_time is null;
