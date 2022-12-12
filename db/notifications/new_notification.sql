insert into notifications(tid, ref_id, type, court_num, message, time, department)
values (${tid}, ${ref_id}, ${type}, ${court_num}, ${message}, now(), 'Referee');

select medical_number, head_referee_phone, referee_coordinator_number,  t.test, country,
(select first from referee where ref_id = ${ref_id}) as first,
(select last from referee where ref_id = ${ref_id}) as last,
(select phone from referee where ref_id = ${ref_id}) as phone
from tournament t
where tid = ${tid};