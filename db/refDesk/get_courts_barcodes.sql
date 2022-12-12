select distinct on (court_num) c.court_num,  c.ref_id, r.first, r.last, s.barcode

from courts c 
    
    left join ref_signup s
    on c.ref_id = s.ref_id
    left join referee r
    on s.ref_id = r.ref_id 

where tournament_id = ${tid}
order by c.court_name, c.court_num;