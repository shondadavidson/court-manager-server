select * from courts c
where c.tournament_id = ${tournament_id} 
order by c.court_num;

