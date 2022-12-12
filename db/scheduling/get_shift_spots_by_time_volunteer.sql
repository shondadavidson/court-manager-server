select *,
(
    select coalesce(json_agg(s), '[]'::json)
                from (
                    select s.shift_id, r.ref_id, r.first, r.last, r.credentials, r.credentials_verified
                    from shift_spots s
                    join referee r on
                    r.ref_id = s.ref_id
                    where s.sid = t.sid and s.captain = true
                    order by last, first
                ) s
            ) as captains,
 (
    select coalesce(json_agg(s), '[]'::json)
                from (
                    select s.shift_id, r.ref_id, r.first, r.last, r.credentials, r.credentials_verified
                    from shift_spots s
                    join referee r on
                    r.ref_id = s.ref_id
                    where s.sid = t.sid and s.referee = true and s.waitlist = false
                    order by signup_time
                ) s
            ) as signup,
     (
    select coalesce(json_agg(w), '[]'::json)
                from (
                    select s.shift_id, r.ref_id, r.first, r.last, r.credentials, r.credentials_verified
                    from shift_spots s
                    join referee r on
                    r.ref_id = s.ref_id
                    where s.sid = t.sid and s.waitlist = true
                    order by signup_time 
                ) w
            ) as waitlist,
             (select count(ref_id)
                from (
                    select r.ref_id
                    from shift_spots s
                    join referee r on
                    r.ref_id = s.ref_id
                    where s.sid = t.sid and s.waitlist = false  
                ) s
            ) as count,
            (select count(ref_id)
                from (
                    select r.ref_id
                    from shift_spots s
                    join referee r on
                    r.ref_id = s.ref_id
                    where s.sid = t.sid and s.waitlist = true  
                ) s
            ) as wait_count
            
from shift t
left join volunteer_category c 
on t.vcid = c.vcid
where t.tid = ${tid} and category = 'other' and c.show = true
order by t.name;