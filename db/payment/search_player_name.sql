select ref_id, first|| ' '|| last as name, email
-- ( 
-- select ref_id
--             from (
--                 select status
--                 from ref_signup a
--                 where r.ref_id = a.ref_id and tid = $1
--             ) s
--         ) as status

from referee r 
where last ilike ('%' || $2 || '%') or first ilike ('%' || $2 || '%');