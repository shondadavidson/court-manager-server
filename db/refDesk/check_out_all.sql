update  ref_signup
set status =  false,
end_time = now(),
last_match = false,
quick_break = false,
checkout_note = '',
shift_checkin = null
where tid = ${tid};

update volunteer_time_log 
set total_time = now() - checkin,
checkout = now()
where tid = ${tid} and checkout is null and type = 'referee';

select * from referee r
join ref_signup s on s.ref_id = r.ref_id
where s.tid = ${tid}
order by r.last, r.first;