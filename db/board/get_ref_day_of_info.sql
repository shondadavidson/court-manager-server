select r.ref_id, first, last, credentials, status, on_court, 
quick_break, last_match, shift_checkin, court_num, note, side_queue , tag, 
(
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
left join ref_signup s 
on r.ref_id = s.ref_id
where s.ref_id = ${ref_id} and tid = ${tid};