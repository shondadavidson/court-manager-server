select COALESCE(payment_note,'') as note
from court_assignments
where id = ${id};