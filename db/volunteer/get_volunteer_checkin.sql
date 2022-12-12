select sid, name, shift,
 (
    select coalesce(json_agg(s), '[]'::json)
                from (
                    select 
                     s.shift_id,  r.ref_id, r.first, r.last,  
                    s.checkin, ls.status
                    from shift_spots s
                    left join volunteer_signup ls
                  on ls.ref_id = s.ref_id
                    left join referee r on
                    r.ref_id = s.ref_id
                  
                    where s.sid = t.sid  
                  
                    order by last, first 
  
                ) s
            ) as signup
            
 
from shift t
where tid = ${tid} and category = 'other'
order by name;