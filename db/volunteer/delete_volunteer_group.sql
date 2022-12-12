update volunteer_signup
    set gid = null
    where gid = ${vgid};

delete from volunteer_groups
where vgid = ${vgid};