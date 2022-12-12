update ref_signup
set admin = !admin
where ref_id = ${ref_id} and tid = ${tid};

select * from referee r
join ref_signup s on s.ref_id = r.ref_id
where s.tid = ${tid}
order by r.last, r.first;