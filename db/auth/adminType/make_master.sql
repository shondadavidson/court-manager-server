update tournament_auth 
set admin_type = ${type}
where tid = ${tid} and ref_id = ${ref_id};