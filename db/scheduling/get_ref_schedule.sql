select t.tid, tn.name as tournament, t.name, s.referee, s.waitlist, s.line_judge, s.sid, 
COALESCE((select name from volunteer_category where vcid = t.vcid), t.category, '') as category, 
to_char( start_time AT TIME ZONE (select time_zone from tournament where tid = t.tid), 'Dy MM/DD HH24:MI') as start_time,
to_char( end_time AT TIME ZONE (select time_zone from tournament where tid = t.tid), 'HH24:MI') as end_time,
to_char( start AT TIME ZONE (select time_zone from tournament where tid = t.tid), 'MM/DD') as start,
to_char( end_date AT TIME ZONE (select time_zone from tournament where tid = t.tid), 'MM/DD/YYYY') as end


    from shift_spots s
    left join shift t
    on t.sid = s.sid 
    left join tournament tn     
    on t.tid = tn.tid
    where s.ref_id = ${id} and tn.end_date > now()
    order by tn.start, start_time, t.category, t.name;