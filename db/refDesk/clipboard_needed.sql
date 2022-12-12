update court_assignments
set clipboard = true
where id = ${id};

update courts 
    set ref_id = null,
    start_time = null,
    current_match = null
where current_match = ${id};