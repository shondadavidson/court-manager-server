select s.ref_id, first, last, credentials
from volunteer_signup s 
left join referee r 
on r.ref_id = s.ref_id
where tid = (select tid from volunteer_category where vcid = ${vcid})
order by last, first