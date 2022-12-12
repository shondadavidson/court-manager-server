select s.ref_id, last || ', '|| first as name,
email, paypal, venmo, zelle, address || ', '|| city || ' '|| state || ' '|| zip as address,

COALESCE((select sum(amount) from court_assignments where tid = s.tid and ref_id = s.ref_id and amount is not null),0) as lead_amount,
COALESCE((select sum(second_amount) from court_assignments where tid = s.tid and second_ref = s.ref_id),0) as second_amount,
    COALESCE((select sum(amount) from court_assignments where tid = s.tid and ref_id = s.ref_id and amount is not null) +
(select sum(second_amount) from court_assignments where tid = s.tid and second_ref = s.ref_id),0) 
as total_amount

from ref_signup s 
left join referee r 
on r.ref_id = s.ref_id 
where tid = ${tid} and first is not null
order by last, first;
