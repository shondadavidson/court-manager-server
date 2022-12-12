select *
    , (
    select coalesce(json_agg(s), '[]'::json)
                from (
                    select s.shift_id, r.ref_id, r.first, r.last, r.credentials, r.credentials_verified
                    from shift_spots s
                    join referee r on
                    r.ref_id = s.ref_id
                    where s.sid = t.sid and s.line_judge = true
                    order by last, first
                ) s
            ) as lineJudge
            
 
from shift t
where tid = ${tid};