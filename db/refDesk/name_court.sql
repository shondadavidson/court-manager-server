update courts
set court_num = ${name}
where tournament_id = ${tid} and court_order = ${court};