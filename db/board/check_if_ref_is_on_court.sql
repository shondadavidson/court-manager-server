select court_num from ref_signup 
where tid = ${tid} and ref_id = ${ref_id}
and on_court = true;