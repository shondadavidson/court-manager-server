select (start::date - INTERVAL '1 DAY') <= now()::date as started
from tournament
where tid = ${tid};