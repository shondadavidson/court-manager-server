select court_num,  COALESCE(medal, ' ') as medal, COALESCE(match_time::INTEGER, 0) as match_time, gold, name, location, match_type, 
to_char((start_time AT TIME ZONE 'utc' AT TIME ZONE (select time_zone from tournament where tid = c.tid)), 'MM/DD/YYYY') as date,
to_char((start_time AT TIME ZONE 'utc' AT TIME ZONE (select time_zone from tournament where tid = c.tid)), 'HH12:MI am') as start_time,
to_char((end_time AT TIME ZONE 'utc' AT TIME ZONE (select time_zone from tournament where tid = c.tid)), 'HH12:MI am') as end_time,
COALESCE(
(select ref_cred where c.ref_id = ${ref_id}), 
(select second_cred where c.second_ref = ${ref_id}), ''
) as credentials, 
COALESCE(
(select paid where c.ref_id = ${ref_id}), 
(select paid where c.second_ref = ${ref_id})
) as paid,
COALESCE(
(select amount where c.ref_id = ${ref_id}), 
(select second_amount where c.second_ref = ${ref_id}), 0
) as amount,
COALESCE(
((select 'Lead Referee, Supporting = ' || first || ' '|| last from referee where ref_id = c.second_ref and c.ref_id = ${ref_id})), 
((select 'Supporting Referee, Lead Ref = ' || first || ' '|| last from referee where ref_id = c.ref_id and c.second_ref = ${ref_id})), ' '
) as note
from court_assignments c
left join tournament t on t.tid = c.tid
where c.ref_id = ${ref_id} or second_ref = ${ref_id}
order by c.start_time desc;