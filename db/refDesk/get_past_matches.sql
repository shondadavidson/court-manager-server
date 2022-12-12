select a.court_num, a.ref_id,
to_char(((start_time AT TIME ZONE 'UTC') AT TIME ZONE (select time_zone from tournament where tid = ${tid})), 'MM/DD') as date, 
to_char(((start_time AT TIME ZONE 'UTC') AT TIME ZONE (select time_zone from tournament where tid = ${tid})), 'HH12:MI am') as start_time,
to_char(((end_time AT TIME ZONE 'UTC') AT TIME ZONE (select time_zone from tournament where tid = ${tid})), 'HH12:MI am') as end_time, 
 match_time::integer, medal, id, first, last, match_type, ref_cred as credentials, sysid, second_cred, amount::integer, 
case when paid = TRUE then 'yes' else 'no' end as paid, second_amount::integer, 
case when second_paid = TRUE then 'yes' else 'no' end as second_paid,
(select COALESCE(concat(first, ' ', last),'') as second from referee where ref_id = a.second_ref and a.tid = ${tid})
from  court_assignments a
left join referee r 
on r.ref_id = a.ref_id
where tid = ${tid}
order by a.end_time desc;