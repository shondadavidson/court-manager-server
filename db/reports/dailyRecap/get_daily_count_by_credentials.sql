select count(id), ref_cred
from court_assignments a 
where tid = ${tid}
and ((start_time AT TIME ZONE 'UTC') AT TIME ZONE (select time_zone from tournament where tid = a.tid) )::date = ${day}
group by ref_cred  
order by 
CASE ref_cred
      WHEN 'Certified' THEN 1
      WHEN 'Level 2' THEN 2
      WHEN 'Level 1' THEN 3
      WHEN 'Not Rated' THEN 4
      ELSE 5
END ;