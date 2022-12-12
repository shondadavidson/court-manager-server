select *,
COALESCE(
to_char( start_time AT TIME ZONE (select time_zone from tournament where tid = t.tid), 'Dy MM/DD HH:MI am') || ' - ' || to_char( end_time AT TIME ZONE (select time_zone from tournament where tid = t.tid), 'HH:MI am'), '') as time,
 (
    select coalesce(json_agg(s), '[]'::json)
                from (
                    select 
                     s.shift_id,  r.ref_id, r.first, r.last, r.credentials, r.credentials_verified, 
                    s.checkin, ls.status, last_match
                    from shift_spots s
                    left join referee r on
                    r.ref_id = s.ref_id
                  left join ref_signup ls
                  on ls.ref_id = s.ref_id
                    where s.sid = t.sid  and s.waitlist = false and ls.tid = ${tid}
                  and (start_time::date = now()::date or start_time is null)
                  order by start_time, name, last, first
  
                ) s
            ) as signup
            
 
from shift t
where tid = ${tid} and category = 'Referee' and start_time::date >= now()::date
order by name;