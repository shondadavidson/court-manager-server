select v.ref_id, first || ' ' ||last as name, credentials, phone, email, request_time, approved_time,
(select count(*) from shift_spots where tid = ${tid} and referee = true and ref_id = v.ref_id ),
COALESCE(
(case when v.referee_approved = true then 'approved' end), 
(case when v.referee_approved = false then 'denied' end), 
(case when v.referee_request = true then 'requested' end)
) AS status
from volunteer_auth v
left join referee r
on v.ref_id = r.ref_id
where tid = ${tid}
order by last, first;