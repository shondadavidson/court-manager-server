delete from ref_signup 
where tid = ${tid} and ref_id = ${ref_id};

select * from referee r
join ref_signup s on s.ref_id = r.ref_id
where s.tid = ${tid}
order by r.last, r.first;