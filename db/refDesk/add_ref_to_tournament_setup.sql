insert into ref_signup 
(ref_id, tid, status)
  
SELECT ${ref_id}, ${tid}, false
WHERE
    NOT EXISTS (
        SELECT ref_id, tid FROM ref_signup WHERE ref_id = ${ref_id} and tid = ${tid}
    );


select * from referee r
join ref_signup s on s.ref_id = r.ref_id
where s.tid = ${tid}
order by r.last, r.first;