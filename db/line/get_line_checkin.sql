select *,
 (
    select coalesce(json_agg(s), '[]'::json)
                from (
                    select 
                     s.shift_id,  r.ref_id, r.first, r.last, r.credentials, r.credentials_verified, 
                    s.checkin, ls.status, rs.court_num as ref_court, rs.status as ref_checkin
                    from shift_spots s
                    left join referee r on
                    r.ref_id = s.ref_id
                      left join line_signup ls
                      on ls.ref_id = s.ref_id
                        left join ref_signup rs 
                        on rs.ref_id = ls.ref_id 
                    where s.sid = t.sid  and s.waitlist = false and ls.tid = ${tid}
                  
                    order by last, first
  
                ) s
            ) as signup
            
 
from shift t
where tid = ${tid} and category = 'Line Judge'
order by name;