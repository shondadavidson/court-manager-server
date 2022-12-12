update ref_signup
set side_queue = true,
    end_time = now(),
    note = ${note}
where tid = ${tid} and ref_id = ${ref_id};