select s.ref_id, first, last, credentials, court_num, gid, s.status
from referee r
join line_signup s on s.ref_id = r.ref_id
where s.tid = ${tid}
order by r.last, r.first;