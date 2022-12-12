select t.name, s.referee, s.waitlist, s.line_judge, s.sid, 
COALESCE((select name from volunteer_category where vcid = t.vcid), t.category, '') as category, start_time, end_time
    from shift_spots s
    left join shift t
    on t.sid = s.sid 
    where s.ref_id = ${ref_id} and t.tid = ${tid}
    order by start_time, t.category, t.name;