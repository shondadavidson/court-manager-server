select vc.name as category, s.name as shift, start_time, end_time, color,  vc.description as category_description, s.description as shift_description,
shift_id, ss.ref_id, first || ' '|| last as name, 
to_char((start_time AT TIME ZONE (select time_zone from tournament where tid = ${tid})), 'MM/DD HH12:MI am') as start_time,
to_char((end_time AT TIME ZONE (select time_zone from tournament where tid = ${tid})), 'HH12:MI am') as end_time,
COALESCE(s.name, '')as shift, color, 
COALESCE((select name from volunteer_category where vcid = s.vcid ) , '')as category,
(select COALESCE(status, false) from volunteer_signup where ref_id = r.ref_id and tid = s.tid) as checkin


from volunteer_category_admin a 
left join volunteer_category vc 
on a.vcid = vc.vcid
left join shift s 
on s.vcid = vc.vcid
left join shift_spots ss 
on s.sid = ss.sid 
left join referee r 
on r.ref_id = ss.ref_id
where a.tid = ${tid} and a.ref_id = ${ref_id}
and start_time::date = ${day}
and ss.ref_id is not null
order by s.start_time, vc.name, s.name, r.last, r.first