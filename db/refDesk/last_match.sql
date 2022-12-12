update  ref_signup
set last_match =  not last_match
where ref_id = ${ref_id} and tid = ${tid};

insert into recap (tid, ref_id, status, date_time)
values (${tid}, ${ref_id}, 'Last Match', now());


select * from referee r
join ref_signup s on s.ref_id = r.ref_id
where s.tid = ${tid}
order by r.last, r.first;