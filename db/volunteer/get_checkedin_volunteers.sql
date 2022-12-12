select r.ref_id, r.first, r.last, v.status

from volunteer_signup v
left join referee r
on v.ref_id = r.ref_id

where tid = ${tid} and gid is null and status = true
order by r.last, r.first;