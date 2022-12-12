select distinct(start_time::date)::text,
(to_char(start_time::date , 'DY')) as day,
(to_char(start_time::date , 'MM-DD')) as date 
from shift
where category = 'other' and tid = ${tid}
order by start_time;