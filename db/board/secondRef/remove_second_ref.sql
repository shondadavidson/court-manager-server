update ref_signup 
set on_court = false,
court_num = null
where ref_id = (select second_ref from court_assignments where id = ${id}) and tid = (select tid from court_assignments where id = ${id});

update court_assignments
set second_ref = null,
second_amount = null,
    second_cred = null,
    second_paid = null
where id = ${id};

update courts 
set second_ref = null
where current_match = ${id};