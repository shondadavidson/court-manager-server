update court_assignments
set start_time = now()
where id = ${id};

update courts 
set start_time = now()
where current_match = ${id};