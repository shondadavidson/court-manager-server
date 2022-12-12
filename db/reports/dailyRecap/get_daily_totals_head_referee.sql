select ref_cred,sum(amount), count(id), amount
from court_assignments a 
where tid = ${tid}
and ((start_time AT TIME ZONE 'UTC') AT TIME ZONE (select time_zone from tournament where tid = a.tid) )::date = ${day}
and amount is not null
group by amount, ref_cred
order by ref_cred, 
CASE ref_cred
      WHEN 'Certified' THEN 1
      WHEN 'Level 2' THEN 2
      WHEN 'Level 1' THEN 3
      WHEN 'Not Rated' THEN 4
      ELSE 5
END, 
amount desc;