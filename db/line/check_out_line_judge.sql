update line_signup
set status = false,
    gid = null,
    end_time = now()
where ref_id = ${ref_id} and tid = ${tid};

update shift_spots
    set gid = null
    where ref_id = ${ref_id} and tid = ${tid};