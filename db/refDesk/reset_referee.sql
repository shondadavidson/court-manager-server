update ref_signup
set status = true,
    on_court = false,
    court_num = null,
    end_time = now(),
    note = null
where ref_id = ${ref_id} and tid = ${tid};


update court_assignments
set end_time = now()
where end_time is null and tid = ${tid} and ref_id = ${ref_id};
