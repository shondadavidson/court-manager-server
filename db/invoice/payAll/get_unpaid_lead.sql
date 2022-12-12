select id, COALESCE(payment_note, '') as note
from court_assignments 
where tid = ${tid} and ref_id = ${ref_id} and paid = false;