select a.court_num, a.ref_id, start_time, a.end_time, match_time, medal, id, first, last, match_type, ref_cred as credentials, sysid, second_cred, amount, paid, second_amount, second_paid,
(select COALESCE(concat(first, ' ', last),'') as second from referee where ref_id = a.second_ref and a.tid = ${tid})
from  court_assignments a
left join referee r 
on r.ref_id = a.ref_id
where tid = ${tid} and end_time is not null and (medal = 'Gold' or medal = 'Bronze')
order by start_time::date, medal, last, first;