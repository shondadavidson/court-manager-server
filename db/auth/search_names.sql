select ref_id, first, last,
(select EXISTS(select ref_id from user_auth where ref_id = r.ref_id)) as login 
from referee r 
where last ilike ('%' || $1 || '%') or first ilike ('%' || $1 || '%');