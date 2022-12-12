update ref_signup
set schedule = ${schedule}
where tid = ${tid} and ref_id = ${ref_id};

select schedule from ref_signup
where tid = ${tid} and ref_id = ${ref_id};