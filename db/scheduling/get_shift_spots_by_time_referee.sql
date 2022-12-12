select *,
COALESCE(
to_char( start_time AT TIME ZONE (select time_zone from tournament where tid = t.tid), 'Dy MM/DD HH:MI am') || ' - ' || to_char( end_time AT TIME ZONE (select time_zone from tournament where tid = t.tid), 'HH:MI am'), '') as time,
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
            ) as wait_count,
            (select count(certified)
                from (
                    select certified
                    from shift_spots s
                    join referee r on
                    r.ref_id = s.ref_id
                    where s.sid = t.sid and s.waitlist = false and credentials = 'Certified' 
                ) s
            ) as certified_filled,
            (select count(level_one)
                from (
                    select level_one
                    from shift_spots s
                    join referee r on
                    r.ref_id = s.ref_id
                    where s.sid = t.sid and s.waitlist = false and credentials = 'Level 1' 
                ) s
            ) as level_one_filled,
            (select count(level_two)
                from (
                    select level_two
                    from shift_spots s
                    join referee r on
                    r.ref_id = s.ref_id

                    where s.sid = t.sid and s.waitlist = false  and credentials = 'Level 2' 
                ) s
            ) as level_two_filled,
            (select count(none)
                from (
                    select none
                    from shift_spots s
                     join referee r on
                    r.ref_id = s.ref_id

                    where s.sid = t.sid and s.waitlist = false  and credentials = 'Not Rated' 
                ) s
            ) as none_filled,
            (select count(wait_certified)
                from (
                    select wait_certified
                    from shift_spots s
                    join referee r on
                    r.ref_id = s.ref_id
                    where s.sid = t.sid and s.waitlist = true  and credentials = 'Certified' 
                ) s
            ) as wait_certified_filled,
            (select count(wait_level_one)
                from (
                    select wait_level_one
                    from shift_spots s
                    join referee r on
                    r.ref_id = s.ref_id
                    where s.sid = t.sid and s.waitlist = true  and credentials = 'Level 1' 
                ) s
            ) as wait_level_one_filled,
            (select count(wait_level_two)
                from (
                    select wait_level_two
                    from shift_spots s
                    join referee r on
                    r.ref_id = s.ref_id
                    where s.sid = t.sid and s.waitlist = true  and credentials = 'Level 2' 
                ) s
            ) as wait_level_two_filled,
            (select count(wait_none)
                from (
                    select wait_none
                    from shift_spots s
                    join referee r on
                    r.ref_id = s.ref_id
                    where s.sid = t.sid and s.waitlist = true and credentials = 'Not Rated' 
                ) s
            ) as wait_none_filled
            
 
from shift t
where tid = ${tid} and category = 'Referee'
order by start_time, name;