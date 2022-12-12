select t.start_time::date,  count(id)
from line_assignments t
where tid = ${tid}
group by t.start_time::date
order by start_time