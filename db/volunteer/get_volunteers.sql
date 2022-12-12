select v.ref_id, status, first, last from 
volunteer_signup v
left join referee r
on r.ref_id = v.ref_id
where tid = ${tid}
order by last, first;