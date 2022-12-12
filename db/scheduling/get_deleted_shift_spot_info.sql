select r.ref_id, waitlist, t.tid, t.name as tournament_name, first, last, 
COALESCE(email, '') as email, s.name as shift_name, 
COALESCE((select name from volunteer_category where vcid = s.vcid ) , s.category, '')as category,
COALESCE(
to_char( start_time AT TIME ZONE (select time_zone from tournament where tid = s.tid), 'Dy MM/DD HH:MI am'), '') as start,
COALESCE(
to_char( end_time AT TIME ZONE (select time_zone from tournament where tid = s.tid), 'HH:MI am'), '') as end,
COALESCE(
(select referee_coordinator_email from tournament where tid = s.tid and s.category = 'Referee'),
(select line_coordinator_email from tournament where tid = s.tid and s.category = '	Line Judge'),
(select volunteer_coordinator_email from tournament where tid = s.tid and s.category = 'other'),
'') as coordinator_email
from shift_spots ss
left join referee r on r.ref_id = ss.ref_id
left join shift s on s.sid = ss.sid
left join tournament t on s.tid = t.tid
where shift_id = ${shift_id};