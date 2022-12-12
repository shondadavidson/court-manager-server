select nid, n.tid, r.ref_id, court_num, type, message, first, last, department, 

to_char( time AT TIME ZONE 'UTC' AT TIME ZONE t.time_zone, 'Dy MM/DD HH:MI am') as time
from notifications n
left join referee r
on r.ref_id = n.ref_id
left join tournament t 
on t.tid = n.tid
where n.tid = ${tid} and n.active = true
order by time desc;