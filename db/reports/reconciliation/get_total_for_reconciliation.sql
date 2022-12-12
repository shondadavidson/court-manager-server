select tid,
COALESCE((select sum(amount) 
from court_assignments 
where paid = true and tid = t.tid), 0) as lead_sum,
COALESCE((select sum(amount) 
from court_assignments 
where paid = false and tid = t.tid), 0) as lead_due,

COALESCE((select sum(second_amount) 
from court_assignments 
where second_paid = true and tid = t.tid), 0) as supporting_sum,
COALESCE((select sum(second_amount) 
from court_assignments 
where second_paid = false and tid = t.tid), 0) as supporting_due,

(
(select COALESCE(sum(amount), 0)
from court_assignments 
where paid = true and tid = t.tid) +

(select COALESCE(sum(second_amount), 0) 
from court_assignments 
where second_paid = true and tid = t.tid)
) as total,

(
(select COALESCE(sum(amount), 0)
from court_assignments 
where paid = true and tid = t.tid and posted = true and amount is not null) +
COALESCE(
(select COALESCE(sum(second_amount), 0)
from court_assignments 
where second_paid = true and tid = t.tid and posted_second = true and second_amount is not null)
, 0)) as posted_total

from tournament t 
where tid = ${tid};