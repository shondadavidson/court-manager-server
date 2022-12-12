select id, court_num, 
start_time as start,
to_char(((start_time AT TIME ZONE 'UTC') AT TIME ZONE (select time_zone from tournament where tid = ${tid})), 'MM/DD HH12:MI am') as start_time,
to_char(((end_time AT TIME ZONE 'UTC') AT TIME ZONE (select time_zone from tournament where tid = ${tid})), 'HH12:MI am') as end_time,
medal, match_type, 

COALESCE(match_time, '-') as match_time, sysid, paid, amount, ref_cred, posted, payment_note,
COALESCE((select certified_amount from tournament where tid = ${tid} and ref_cred = 'Certified'), 
(select level_two_amount from tournament where tid = ${tid} and ref_cred = 'Level 2'),
(select level_one_amount from tournament where tid = ${tid} and ref_cred = 'Level 1'),
(select level_one_amount from tournament where tid = ${tid} and ref_cred = 'Level 1'),
(select volunteer_amount from tournament where tid = ${tid} and ref_cred = 'Not Rated'), 0) as estimated_amount,
(select COALESCE(first || ' '|| last, '') from referee where ref_id = a.second_ref) as other_ref
from court_assignments a 
where ref_id = ${ref_id} and tid = ${tid}
order by start, id;