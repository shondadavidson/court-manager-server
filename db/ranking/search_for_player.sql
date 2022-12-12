select pid, (first || ' '|| last) as name,
(select count(id) from rank_partner where eid = $1 and (pid1 = p.pid or pid2 = p.pid))
from rank_player p
where last ilike ('%' || $2 || '%') or first ilike ('%' || $2 || '%');