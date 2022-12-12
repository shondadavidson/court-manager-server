select 
COALESCE((select sum(amount)), 0) as lead_total,
COALESCE((select sum(second_amount)), 0) as second_total,
COALESCE((select count(id)), 0) as match_count,
COALESCE((select sum(second_ref)), 0) as second_count 

from court_assignments a 
where tid = ${tid}  ;