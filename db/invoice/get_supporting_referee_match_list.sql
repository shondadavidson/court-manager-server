select id, court_num, 
start_time as start,
to_char(((start_time AT TIME ZONE 'UTC') AT TIME ZONE (select time_zone from tournament where tid = ${tid})), 'MM/DD HH12:MI am') as start_time,
to_char(((end_time AT TIME ZONE 'UTC') AT TIME ZONE (select time_zone from tournament where tid = ${tid})), 'HH12:MI am') as end_time, 
medal, match_type, match_time, sysid, second_paid as paid, second_amount as amount, second_cred as ref_cred, posted_second as posted, payment_note,
COALESCE((select certified_amount from tournament where tid = ${tid} and ref_cred = 'Certified'),
(select level_two_amount from tournament where tid = ${tid} and ref_cred = 'Level 2'),
(select level_one_amount from tournament where tid = ${tid} and ref_cred = 'Level 1'),
(select level_one_amount from tournament where tid = ${tid} and ref_cred = 'Level 1'),
(select volunteer_amount from tournament where tid = ${tid} and ref_cred = 'Not Rated'), 0) as estimated_amount,
(select COALESCE(first || ' '|| last, '') from referee where ref_id = a.ref_id) as other_ref
from court_assignments a
where second_ref = ${ref_id} and tid = ${tid}
order by start, id;