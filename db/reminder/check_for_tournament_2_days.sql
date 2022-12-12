select  tid, name
from tournament
where  status = 'active' and start  >=  now()::date - interval '3 day' and and test is false
order by start;