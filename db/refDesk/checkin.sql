update  ref_signup
set status =  not status,
end_time = now(),
last_match = false,
quick_break = false,
checkout_note = ${checkout_note},
shift_checkin = null,
side_queue = false,
note = ''
where ref_id = ${ref_id} and tid = ${tid};

insert into recap (tid, ref_id, status, reason, date_time)
values (${tid}, ${ref_id}, 'Check in/ out', ${checkout_note}, now());
