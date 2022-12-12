select id, COALESCE(payment_note, '') as note
from court_assignments 
where tid = ${tid} and second_ref = ${ref_id} and (second_paid = false or second_paid is null);