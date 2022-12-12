update line_groups
    set group_name = ${group_name},
        color = ${color}
    where gid = ${gid};

select *,
(
    select coalesce(json_agg(s), '[]'::json)
                from (
                    select s.shift_id, r.ref_id, r.first, r.last, s.checkin, s.checkin, s.checkin_time
                    from shift_spots s
                    join referee r on 
                    r.ref_id = s.ref_id
                    
                    where s.sid = ${sid} and (l.gid = s.gid)
                    order by last, first
                ) s
            ) as signup,
(
    select coalesce(json_agg(s), '[]'::json)
                from (
                    select s.shift_id, r.ref_id, r.first, r.last, s.checkin, s.checkin_time
                    from shift_spots s
                    join referee r on 
                    r.ref_id = s.ref_id
                    
                    where s.sid = ${sid} and gid is null
                    order by checkin_time nulls last, last, first
                ) s
            ) as no_group
from line_groups l
where tid = ${tid} and sid = ${sid}
order by court_num NULLS first, finished nulls first;