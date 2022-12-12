select count(id), ref_cred
from court_assignments a 
where tid = ${tid}
group by ref_cred
order by
CASE ref_cred
      WHEN 'Certified' THEN 1
      WHEN 'Level 2' THEN 2
      WHEN 'Level 1' THEN 3
      WHEN 'Not Rated' THEN 4
      ELSE 5
END ;