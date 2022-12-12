update  ref_signup
set quick_break =  true
where ref_id = ${ref_id} and tid = ${tid};

insert into recap (tid, ref_id, status, date_time)
values (${tid}, ${ref_id}, 'Quick Break On/Off', now());