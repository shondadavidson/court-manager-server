select v.ref_id, first, last, credentials, phone, email, referee_request_note, request_time, approved_time, response
from volunteer_auth v
left join referee r
on v.ref_id = r.ref_id
where tid = ${tid} and referee_approved is null and referee_request = true
order by last, first;