select 
first || ' '|| last as name, signature, 
COALESCE(
to_char( signature_date AT TIME ZONE (select time_zone from tournament where tid = v.tid), 'MM/DD/YY HH:MI am'), '') as signature_date, signed
from volunteer_signup v
left join referee r 
on r.ref_id = v.ref_id
where tid = ${tid}
order by last, first;