select COALESCE(NULLIF(procedures, ''), 'none' ) as procedures, name
from tournament
where tid = ${tid};