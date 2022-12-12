select DISTINCT r.email, first, last, r.ref_id
from tournament t
left join ref_signup s
on t.tid = s.tid

left join line_signup l
on t.tid = l.tid 

left join volunteer_signup v
on t.tid = v.tid

left join tournament_auth a
on a.tid = t.tid

left join referee r 
on r.ref_id = s.ref_id 

where t.tid = ${tid} and email ilike ('%' || '@' || '%');