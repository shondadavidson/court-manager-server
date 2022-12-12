select count(id), second_cred
from court_assignments a 
where tid = ${tid}
and second_cred is not null 
group by second_cred
order by
CASE second_cred
      WHEN 'Certified' THEN 1
      WHEN 'Level 2' THEN 2
      WHEN 'Level 1' THEN 3
      WHEN 'Not Rated' THEN 4
      ELSE 5
END ;