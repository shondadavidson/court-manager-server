select r.ref_id, first, last, phone, alt_phone, r.email, credentials, id 
from referee r 
left join user_auth u
on r.ref_id = u.ref_id
order by last, first