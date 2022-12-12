select COALESCE(name, '') as name, waitlist, 
COALESCE((select name from volunteer_category where vcid = x.vcid ) , x.category, '')as category,
COALESCE(
to_char( start_time AT TIME ZONE (select time_zone from tournament where tid = x.tid), 'Dy MM/DD HH:MI am'), '') as start,
COALESCE(
to_char( end_time AT TIME ZONE (select time_zone from tournament where tid = x.tid), 'HH:MI am'), '') as end
from shift_spots s
left join shift x 
on s.sid = x.sid
where ref_id = ${ref_id} and s.tid = ${tid}
order by category, name; 