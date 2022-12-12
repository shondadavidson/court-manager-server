select sid, COALESCE(t.name, '') as name, start_time, end_time, spots, wait_spots, pre_reg, color, t.description as shift_description, vc.description as category_description,
COALESCE((select name from volunteer_category where vcid = t.vcid), t.category, '') as category, t.vcid, 
(select count(*) from shift_spots where sid = t.sid and waitlist IS NULL OR NOT true) as spot_count,
(select count(*) from shift_spots where sid = t.sid and waitlist = true) as wait_count,
(select count(*) from shift_spots where sid = t.sid and ref_id = ${ref_id}) as registered,
(select COALESCE( volunteer_signature_required, false) from tournament where tid = ${tid}) as signature_required,
(select signed from volunteer_signup where tid = ${tid} and ref_id = ${ref_id} limit 1) as signed,
(
    select coalesce(json_agg(s), '[]'::json)
                from (
                    select s.shift_id, r.ref_id, r.first, r.last, r.credentials, r.credentials_verified
                    from shift_spots s
                    join referee r on
                    r.ref_id = s.ref_id
                    where s.sid = t.sid and captain = true
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
                    where s.sid = t.sid and s.referee = true and 
                    COALESCE(s.waitlist, FALSE) = false
                    and captain = false
                    order by last, first
                ) s
            ) as signup,
     (
    select coalesce(json_agg(w), '[]'::json)
                from (
                    select s.shift_id, r.ref_id, r.first, r.last, r.credentials, r.credentials_verified
                    from shift_spots s
                    join referee r on
                    r.ref_id = s.ref_id
                    where s.sid = t.sid and s.waitlist = true and captain = false
                    order by last, first
                ) w
            ) as waitlist,
             (select count(ref_id)
                from (
                    select r.ref_id
                    from shift_spots s
                    join referee r on
                    r.ref_id = s.ref_id
                    where s.sid = t.sid and s.waitlist = false and captain = false 
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
left join volunteer_category vc 
on t.vcid = vc.vcid 
where t.tid = ${tid} and vc.show = true
order by t.start_time, name;
