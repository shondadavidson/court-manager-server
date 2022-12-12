update court_assignments 
    set end_time = now(), 
    on_court = false,
    clipboard = false
    where id = ${id};

update ref_signup
    set on_court = false,
    end_time = now()
    where ref_id = ${ref_id} and tid = ${tid};