update tournament_auth 
set line_judge = not line_judge
where tid = ${tid} and ref_id = ${ref_id};