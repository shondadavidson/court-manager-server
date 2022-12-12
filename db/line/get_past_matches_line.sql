select a.court_num, a.ref_id, start_time, a.end_time, match_time, medal, id, first, last, match_type, credentials, sysid
from  line_assignments a
left join referee r 
on r.ref_id = a.ref_id
where tid = ${tid} and end_time is not null
order by a.end_time desc;