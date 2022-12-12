select a.ref_id, first, last 
from user_auth a
left join referee r 
on a.ref_id = r.ref_id
where last ilike ('%' || $1 || '%') or first ilike ('%' || $1 || '%');