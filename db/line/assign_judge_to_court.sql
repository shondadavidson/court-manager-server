insert into line_assignments (tid, ref_id, gid, court_num, start_time)
values (${tid}, ${ref_id}, ${gid}, ${court_num}, now());

update line_signup
    set court_num = ${court_num},
        gid = ${gid},
        on_court = true
    where ref_id = ${ref_id} and tid = ${tid};
