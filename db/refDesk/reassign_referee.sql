update courts 
    set ref_id = null,
    status = 'open',
    start_time = null,
    current_match = null,
    medal = null,
    second_ref = null
    where tournament_id = ${tid} and court_num = ${past_court};

update ref_signup
    set on_court = false,
    court_num = null,
    side_queue = false
    where ref_id = (select ref_id from court_assignments where id = ${id}) and tid = ${tid};

update court_assignments
    set ref_id = ${ref_id},
    court_num = ${court_num},
    paid = ${paid}, 
    amount = ${amount}, 
    ref_cred =${credentials}
    where id = ${id};

update ref_signup
    set on_court = true,
    court_num = ${court_num}
    where ref_id = ${ref_id} and tid = ${tid};

update courts 
    set ref_id = ${ref_id},
    status= 'assigned',
    start_time = now(),
    current_match = ${id},
    medal = ${medal},
    second_ref = (select second_ref from court_assignments where id = ${id})
    where tournament_id = ${tid} and court_num = ${court_num};

    update ref_signup
    set on_court = true,
    court_num = ${court_num}
    where ref_id = (select second_ref from court_assignments where id = ${id}) and tid = ${tid};