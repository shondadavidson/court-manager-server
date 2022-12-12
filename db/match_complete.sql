update match 
set court_num = ${court_num}, status = 'final', end_time = now(), scorecard = ${scorecard}
where match_id = ${match_id};

update courts
set status = 'open', last_scorecard = ${scorecard}, end_time = now()
where court_num = ${court_num} and tournament_id = ${tournament_id};

-- select * from courts c
-- join match m on c.court_num = m.court_num
-- where tournament_id = ${tournament_id} and c.status = 'assigned'
-- order by c.court_num;