select sid, COALESCE(t.name, '')as name, 
to_char((start_time AT TIME ZONE (select time_zone from tournament where tid = t.tid)), 'MM/DD HH12:MI am') as start_time,
to_char((end_time AT TIME ZONE (select time_zone from tournament where tid = t.tid)), 'HH12:MI am') as end_time,
 spots, wait_spots, color, pre_reg, t.vcid, c.name as category,
(
    select coalesce(json_agg(s), '[]'::json)
                from (
                    select s.shift_id, r.ref_id, r.last || ', '|| r.first as volunteer_name, r.credentials, r.credentials_verified
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
                    select s.shift_id, r.ref_id, r.last || ', '|| r.first as volunteer_name, r.credentials, r.credentials_verified
                    from shift_spots s
                    join referee r on
                    r.ref_id = s.ref_id
                    where s.sid = t.sid
                    and (s.waitlist = false or s.waitlist is null) and captain = false
                    order by last, first
                ) s
            ) as signup,
     (
    select coalesce(json_agg(w), '[]'::json)
                from (
                    select s.shift_id, r.ref_id, r.last || ', '|| r.first as volunteer_name, r.credentials, r.credentials_verified
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
left join volunteer_category c 
on t.vcid = c.vcid
where t.vcid = ${vcid}
order by t.start_time, t.name;