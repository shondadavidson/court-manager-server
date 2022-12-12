select first || ' ' || last as name, email
from referee
where ref_id = ${ref_id};