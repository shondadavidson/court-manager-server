WITH rows as (
update time_slots
set checkin = not checkin
where time_id = ${sid}

returning ref_id) 

update  ref_signup
set status =  true
where ref_id = (select ref_id from rows) and tid = ${tid}
returning ref_id;