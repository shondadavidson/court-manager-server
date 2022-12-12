update tournament
set procedures = ${procedures}
where tid = ${tid};

select COALESCE(NULLIF(procedures, ''), 'none' ) as procedures
from tournament
where tid = ${tid};