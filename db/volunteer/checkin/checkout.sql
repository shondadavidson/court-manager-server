update volunteer_time_log 
set total_time = now() - checkin,
checkout = now()
where tid = ${tid} and ref_id = ${ref_id} and checkout is null and type = ${type};