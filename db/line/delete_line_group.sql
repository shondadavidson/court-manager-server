update shift_spots
    set gid = null
    where gid = ${gid};

update line_signup
    set gid = null
    where gid = ${gid};

delete from line_groups
where gid = ${gid};
