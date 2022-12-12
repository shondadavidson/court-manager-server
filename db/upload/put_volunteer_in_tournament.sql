insert into volunteer_signup 
(ref_id, tid, status)
  
SELECT ${ref_id}, ${tid}, false
WHERE
    NOT EXISTS (
        SELECT ref_id, tid FROM volunteer_signup WHERE ref_id = ${ref_id} and tid = ${tid}
    );

