select a.id, a.court_num, a.ref_id, a.on_court, a.clipboard, r.first, r.last 
from court_assignments a
join referee r on r.ref_id = a.ref_id
where tid = ${tid} and clipboard = true
order by court_num;