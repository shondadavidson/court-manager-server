update  ref_signup
set quick_break =  not quick_break
where ref_id = ${ref_id} and tid = ${tid};

insert into recap (tid, ref_id, status, date_time)
values (${tid}, ${ref_id}, 'Quick Break On/Off', now());


-- select * from referee r
-- join ref_signup s on s.ref_id = r.ref_id
-- where s.tid = ${tid}
-- order by r.last, r.first;