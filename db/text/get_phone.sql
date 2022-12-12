select COALESCE(NULLIF(phone, ''), 'none' ) as phone
from referee
where ref_id = ${ref_id};