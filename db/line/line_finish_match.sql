
update courts
set line_group = null
where tournament_id = ${tid} and court_num = ${court_num};

update line_groups
    set court_num = null, 
start = null,
finished = now()
where gid = ${gid};

update line_signup
    set court_num = null,
    on_court = false
    where court_num = ${cn} and tid = ${tid};

update line_assignments
    set end_time = now()
    where tid = ${tid} and court_num = ${court_num} and end_time is null;

    update ref_signup
    set side_queue = false,
    note = null,
    line_court = null
where tid = ${tid} and line_court = ${court_num};