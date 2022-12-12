update volunteer_signup
set gid = null
where ref_id = ${ref_id};

update courts 
set monitor_id = null
where monitor_id = ${ref_id} and tournament_id = ${tid};