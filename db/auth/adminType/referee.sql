update tournament_auth 
set referee = not referee
where tid = ${tid} and ref_id = ${ref_id};