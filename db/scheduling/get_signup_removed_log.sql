select t.ref_id, t.waitlist, t.signup_time, t.removal_time, COALESCE(first || ' '|| last, '') as first_last, COALESCE(first, '') as first, COALESCE(last, '') as last,
r.credentials, 
COALESCE((select name || ' - ' || s.name from volunteer_category where vcid = s.vcid ) , s.category, '') as category,
COALESCE(s.name, '') as name,
COALESCE(
    to_char( start_time AT TIME ZONE (select time_zone from tournament where tid = ${tid}), 'Dy MM/DD HH:MI am'), '') as start,
    COALESCE(
    to_char( end_time AT TIME ZONE (select time_zone from tournament where tid = ${tid}), 'HH:MI am'), '') as end
from shift_spots_backup t
left join referee r
on t.ref_id = r.ref_id
left join shift s
on s.sid = t.sid 
where s.tid = ${tid} and category = ${category}
order by removal_time desc;