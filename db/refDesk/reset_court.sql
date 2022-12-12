update courts
set status = 'open',
start_time = null,
ref_id = null,
second_ref = null, 
current_match = null,
match_starter_id = null,
match_starter_name = null

where court_num = ${court_num} and tournament_id = ${tid};

update court_assignments
set end_time = now()
where end_time is null and court_num = ${court_num} and tid = ${tid};