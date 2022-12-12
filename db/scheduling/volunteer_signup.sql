insert into volunteer_signup 
(ref_id, tid)
  
SELECT ${ref_id}, ${tid}
WHERE
    NOT EXISTS (
        SELECT ref_id, tid FROM volunteer_signup WHERE ref_id = ${ref_id} and tid = ${tid}
    );