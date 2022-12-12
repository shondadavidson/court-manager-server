update  ref_signup
set status =  false,
end_time = now(),
last_match = false,
quick_break = false,
shift_checkin = null,
side_queue = false
where ref_id = ${ref_id} and tid = ${tid};

insert into recap (tid, ref_id, status, date_time)
values (${tid}, ${ref_id}, 'Check out', now());