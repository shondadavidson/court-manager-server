update volunteer_signup
set status = ${status},
end_time = now(),
gid = null
where ref_id = ${ref_id} and tid = ${tid};

update courts 
set monitor_id = null 
where monitor_id = ${ref_id} and tournament_id = ${tid};


select status
from volunteer_signup 
where ref_id = ${ref_id} and tid = ${tid};
