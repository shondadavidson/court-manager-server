update court_assignments
set start_time = now()
where tid = ${tid} and on_court = true;

update courts 
set start_time = now()
where tournament_id = ${tid} and start_time is not null;