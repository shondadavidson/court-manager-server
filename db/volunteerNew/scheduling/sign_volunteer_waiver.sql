insert into volunteer_signup 
(ref_id, tid)
  
SELECT ${ref_id}, ${tid}
WHERE
    NOT EXISTS (
        SELECT ref_id, tid FROM volunteer_signup WHERE ref_id = ${ref_id} and tid = ${tid}
    );
update volunteer_signup
set signature = ${signature},
    signed = true,
    signature_date = now()
where tid = ${tid} and ref_id = ${ref_id};