update time_slots
set ref_id = ${ref_id}
where time_id = ${id};

select *,
( 
select *
            from (
                select status
                from ref_signup a
                where t.ref_id = a.ref_id and tid = ${tid}
            ) s
        ) as status
from time_slots t
left join referee r on r.ref_id = t.ref_id
where tid = ${tid}
order by t.start, t.time_id;