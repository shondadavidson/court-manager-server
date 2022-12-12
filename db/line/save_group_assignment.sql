update line_signup
set gid = ${gid}
where ref_id = ${ref_id} and tid = ${tid};

update ref_signup
    set side_queue = true,
    note = 'Line Judge'
    where tid = ${tid} and ref_id = ${ref_id};

select *,
(
    select coalesce(json_agg(s), '[]'::json)
                from (
                    select * 
                    from
                      line_signup ls
            
                    left join referee r
                    on r.ref_id = ls.ref_id
                    where (lg.gid = ls.gid) and ls.tid = ${tid}
                    order by r.last, r.first
                ) s
            ) as signup
from line_groups lg
where tid = ${tid}
order by court_num NULLS first, finished nulls first;