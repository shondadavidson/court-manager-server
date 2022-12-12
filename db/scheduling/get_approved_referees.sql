select v.ref_id, first, last, 
credentials, phone, email,
v.referee_approved, v.referee_request, v.referee_request_note, request_time, approved_time, response
from volunteer_auth v
left join referee r
on v.ref_id = r.ref_id
where tid = ${tid} 
order by last, first;