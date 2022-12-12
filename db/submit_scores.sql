insert into match (court_num, status, scorecard, end_time, tournament_id, scorecard_thumbnail)
values (${court_num}, 'submitted', ${scorecard}, now(), ${tournament_id}, ${scorecard_thumbnail})