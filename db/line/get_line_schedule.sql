select *,
 (
    select coalesce(json_agg(s), '[]'::json)
                from (
                    select s.shift_id, r.ref_id, r.first, r.last, r.credentials, r.credentials_verified
                    from shift_spots s
                    join referee r on
                    r.ref_id = s.ref_id
                    where s.sid = t.sid  and s.waitlist = false and s.gid is null
                    order by last, first
                ) s
            ) as signup
            
 
from shift t
where tid = ${tid} and category = 'Line Judge'
order by name;