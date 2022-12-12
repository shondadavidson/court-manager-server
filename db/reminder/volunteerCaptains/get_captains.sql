select distinct(v.ref_id), first || ' '|| last as name, email
from volunteer_category_admin v 
left join referee r 
on r.ref_id = v.ref_id
where tid = ${tid};