select court_num, r.ref_id, start_time, match_type, medal, first, last
from court_assignments a 
left join referee r 
on a.ref_id = r.ref_id
where tid = ${tid}
order by start_time;