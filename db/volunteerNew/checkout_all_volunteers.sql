update volunteer_signup
set status = false,
end_time = now()
where tid = ${tid};

update courts 
set monitor_id = null 
where tournament_id = ${tid};

update volunteer_time_log 
set total_time = now() - checkin,
checkout = now()
where tid = ${tid} and checkout is null and type = 'volunteer';

