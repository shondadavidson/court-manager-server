update ref_signup
    set on_court = false,
    court_num = null
    where ref_id = ${ref_id} and tid = ${tid};

update ref_signup
    set on_court = false,
    court_num = null
    where ref_id = ${second_ref} and tid = ${tid};

update courts 
    set ref_id = null,
    start_time = null,
    current_match = null,
    line_group = null,
    medal = null,
    second_ref = null
where current_match = ${id};

delete from court_assignments where id = ${id};