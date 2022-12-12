select distinct(r.ref_id), first, last, email 
from shift_spots s 
left join referee r 
on r.ref_id = s.ref_id
where sid = ANY(${list}::int[]) and r.email is not null;