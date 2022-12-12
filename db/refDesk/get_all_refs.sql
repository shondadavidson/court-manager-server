select r.ref_id, r.first, r.last, r.credentials, r.credentials_verified ,
( 
select *
            from (
                select tid
                from ref_signup a 
                where r.ref_id = a.ref_id and tid= ${tid}
                limit 1
            ) s
        ) as status,
        ( 
select *
            from (
                select true
                from line_signup l
                where r.ref_id = l.ref_id and tid= ${tid}
                limit 1
            ) s
        ) as line_judge
        , (
    select coalesce(json_agg(s), '[]'::json)
                from (  
                    select t.name, t.category
                    from shift_spots s
                    left join shift t
                    on t.sid = s.sid
                    where s.tid = ${tid} and r.ref_id = s.ref_id
                    order by t.name
                ) s
            ) as shifts
from referee r 
order by r.last, r.first;

