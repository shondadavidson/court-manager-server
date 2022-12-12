select tid,
COALESCE((select sum(amount) 
from court_assignments 
where ref_id = ${ref_id} and paid = true and tid = t.tid), 0) as lead_sum,

COALESCE((select sum(second_amount) 
from court_assignments 
where second_ref = ${ref_id} and second_paid = true and tid = t.tid), 0) as supporting_sum,
COALESCE((select count(ref_id) 
from court_assignments 
where ref_id = ${ref_id} and paid = true and tid = t.tid), 0) as lead_count,

COALESCE((select count(ref_id) 
from court_assignments 
where second_ref = ${ref_id} and second_paid = true and tid = t.tid), 0) as supporting_count,

(
(select COALESCE(sum(amount), 0)
from court_assignments 
where ref_id = ${ref_id} and paid = true and tid = t.tid) +

(select COALESCE(sum(second_amount), 0) 
from court_assignments 
where second_ref = ${ref_id} and second_paid = true and tid = t.tid)
) as total,

(
(select COALESCE(sum(amount), 0)
from court_assignments 
where ref_id = ${ref_id} and paid = true and tid = t.tid and posted = true and amount is not null) +
COALESCE(
(select COALESCE(sum(second_amount), 0)
from court_assignments 
where second_ref = ${ref_id} and second_paid = true and tid = t.tid and posted_second = true and second_amount is not null)
, 0)) as posted_total,
(
(select COALESCE(sum(amount), 0)
from court_assignments 
where ref_id = ${ref_id} and paid = not true and tid = t.tid) +

(select COALESCE(sum(second_amount), 0) 
from court_assignments 
where second_ref = ${ref_id} and second_paid = not true and tid = t.tid)
) as total_not_paid,

(select count(id) 
from court_assignments 
where tid = t.tid and ((ref_id = ${ref_id} and paid = false) or (second_ref = ${ref_id} and second_paid = false))) as not_paid_count

from tournament t 
where tid = ${tid};