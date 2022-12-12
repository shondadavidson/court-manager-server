select *,
(
    select coalesce(json_agg(s), '[]'::json)
                from (
                    select ls.ref_id, status, on_court, court_num, gid, first, last, credentials,
                    ( 
select *
            from (
                select court_num
                from ref_signup
                where tid = ${tid} and ref_id = ls.ref_id
            ) s
        ) as referee_court
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