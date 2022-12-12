update ref_signup
set side_queue = false,
    end_time = now(),
    note = null
where tid = ${tid} and ref_id = ${ref_id};