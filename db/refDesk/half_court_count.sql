select ceil(count(court_num)/2) from courts where tournament_id = ${tid};