select c.court_num, c.ref_id, COALESCE(c.start_time::TEXT,'0') as start_time, c.current_match, r.first, r.last, r.phone, r.email, r.credentials, r.credentials_verified
from courts c 
    left join referee r
    on c.ref_id = r.ref_id
where tournament_id = ${tid}
order by c.court_order, c.court_num;

