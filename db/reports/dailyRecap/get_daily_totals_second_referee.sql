select second_cred, sum(second_amount), count(id), second_amount
from court_assignments a 
where tid = ${tid}
and ((start_time AT TIME ZONE 'UTC') AT TIME ZONE (select time_zone from tournament where tid = a.tid) )::date = ${day} 
and second_amount > 0 and second_ref is not null
group by second_amount, second_cred
order by second_cred, 
CASE second_cred
      WHEN 'Certified' THEN 1
      WHEN 'Level 2' THEN 2
      WHEN 'Level 1' THEN 3
      WHEN 'Not Rated' THEN 4
      ELSE 5
END, 
second_amount desc;

  