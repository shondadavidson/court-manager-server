update line_signup
set status = false,
end_time = now(),
gid = null
where tid = ${tid};

update shift_spots
    set gid = null
    where tid = ${tid};