select u.id as user_id, r.first, r.last, password, r.phone, r.email, r.credentials, r.ref_id, u.profile_updated
from user_auth u
left join referee r on r.ref_id = u.ref_id
where u.email ilike ${email};