select distinct(s.ref_id), last || ', ' || first as name, credentials
from ref_signup s
left join referee r 
on r.ref_id = s.ref_id
where last ilike ('%' || $2 || '%') or first ilike ('%' || $2 || '%');