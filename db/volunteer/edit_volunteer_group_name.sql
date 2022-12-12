update volunteer_groups
    set group_name = ${group_name},
        color = ${color}
    where vgid = ${vgid};