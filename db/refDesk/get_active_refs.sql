select r.ref_id, r.last, r.first, r.email, r.phone 
from ref_signup s
left join referee r
on r.ref_id = s.ref_id
where tid = ${tid} and status = true
order by r.last, r.first;