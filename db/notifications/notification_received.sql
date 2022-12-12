update notifications
set active = false
where nid = ${nid};

select COALESCE(r.phone, '0') as phone, t.test, country
from notifications n 
left join tournament t
on n.tid = t.tid 
left join referee r
on r.ref_id = n.ref_id
where nid = ${nid};