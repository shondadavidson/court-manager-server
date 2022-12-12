
select s.shift_id, r.ref_id, r.first, r.last, s.checkin, s.checkin_time
from shift_spots s
join referee r on 
r.ref_id = s.ref_id

where s.sid = ${sid} and gid is null
order by checkin_time nulls last, last, first
                