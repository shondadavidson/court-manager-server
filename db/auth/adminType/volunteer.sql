update tournament_auth 
set volunteer = not volunteer
where tid = ${tid} and ref_id = ${ref_id};