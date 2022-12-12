select ref_id, tid
from court_assignments
where id = ${id} and second_ref is not null;