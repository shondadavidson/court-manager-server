insert into notifications(tid, ref_id, court_num, type, message, time, department)
values (${tid}, ${ref_id},  ${court_num}, ${type}, ${message}, now(), 'Court Monitor');

select COALESCE(referee_coordinator_number, '') as referee_coordinator_number, COALESCE(medical_number,'') as medical_number,  t.test,
(select first from referee where ref_id = ${ref_id}) as first,
(select last from referee where ref_id = ${ref_id}) as last,
(select phone from referee where ref_id = ${ref_id}) as phone, country
from tournament t
where tid = ${tid};