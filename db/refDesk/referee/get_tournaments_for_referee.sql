select t.tid, t.name, to_char(start, 'MM/DD/YYYY') as start , to_char(end_date, 'MM/DD/YYYY') as end,
description 
from ref_signup s 
left join tournament t 
on t.tid = s.tid
where t.start < now()
and s.ref_id = ${ref_id}
order by t.start desc;