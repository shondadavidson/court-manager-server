select 
r.ref_id, status, first, last, credentials, end_time, start_time,
( 
select *
            from (
                select court_num
                from ref_signup
                where tid = ${tid} and ref_id = l.ref_id
            ) s
        ) as referee_court
from line_signup l
left join referee r
on r.ref_id = l.ref_id
where  l.status = true and l.gid is null and l.tid = ${tid}
order by start_time nulls last, last, first;