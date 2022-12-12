select * from match
where tournament_id = ${tournament_id} and status != 'complete'
order by court_num asc;