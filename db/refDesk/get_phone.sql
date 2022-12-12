 select text as send_text, test, country, to_char((now() AT TIME ZONE (select time_zone from tournament where tid = ${tid})), 'MM/DD HH12:MI am') as time,
(select COALESCE(NULLIF(phone,''), 'no') as phone from referee where ref_id = ${ref_id})
from tournament where tid = ${tid};