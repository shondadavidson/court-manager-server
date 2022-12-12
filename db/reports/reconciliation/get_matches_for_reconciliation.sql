select a.id, COALESCE(court_num, '') as court_num, COALESCE((r.first || ' '|| r.last), '') as name,
to_char(((start_time AT TIME ZONE 'UTC') AT TIME ZONE (select time_zone from tournament where tid = ${tid})), 'MM/DD HH12:MI am') as start_time,
to_char(((end_time AT TIME ZONE 'UTC') AT TIME ZONE (select time_zone from tournament where tid = ${tid})), 'HH12:MI am') as end_time,
match_type, 
COALESCE(match_time, '-') as match_time, sysid, amount, COALESCE(paid, false) as paid, 
COALESCE((select certified_amount from tournament where tid = ${tid} and credentials = 'Certified'), 
(select level_two_amount from tournament where tid = ${tid} and credentials = 'Level 2'),
(select level_one_amount from tournament where tid = ${tid} and credentials = 'Level 1'),
(select level_one_amount from tournament where tid = ${tid} and credentials = 'Level 1'),
(select volunteer_amount from tournament where tid = ${tid} and credentials = 'Not Rated'), 0) as estimated_amount,
ref_cred,  
COALESCE((select (first || ' ' ||last) from referee where ref_id = second_ref), '') as supporting, second_amount, COALESCE(second_paid, false) as second_paid, 
COALESCE((select certified_amount from tournament where tid = ${tid} and second_cred = 'Certified'), 
(select level_two_amount from tournament where tid = ${tid} and second_cred = 'Level 2'),
(select level_one_amount from tournament where tid = ${tid} and second_cred = 'Level 1'),
(select level_one_amount from tournament where tid = ${tid} and second_cred = 'Level 1'),
(select volunteer_amount from tournament where tid = ${tid} and second_cred = 'Not Rated'), 0) as estimated_supporting_amount,
second_cred,
COALESCE(posted, false) as posted, 
COALESCE(posted_second, false) as posted_second, 
payment_note
from court_assignments a 
left join referee r 
on a.ref_id = r.ref_id 
where tid = ${tid} 
order by end_time, id