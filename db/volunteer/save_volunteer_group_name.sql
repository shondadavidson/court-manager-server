insert into volunteer_groups(group_name, tid, color)
values (${group_name}, ${tid}, ${color});

select *,
(
    select coalesce(json_agg(s), '[]'::json)
                from (
                    select vs.ref_id, status, gid, first, last
                    from 
                      volunteer_signup vs
        
                    left join referee r
                    on r.ref_id = vs.ref_id
                    where (vg.vgid = vs.gid) and vs.tid = ${tid}
                    order by r.last, r.first
                ) s
            ) as signup
from volunteer_groups vg 
where tid = ${tid}
order by group_name 