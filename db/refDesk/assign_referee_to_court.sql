update ref_signup
    set on_court = true,
    court_num = ${court_num},
    side_queue = false
    where ref_id = ${ref_id} and tid = ${tid};