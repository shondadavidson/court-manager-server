insert into ref_signup 
(ref_id, tid)
  
SELECT ${ref_id}, ${tid}
WHERE
    NOT EXISTS (
        SELECT ref_id, tid FROM ref_signup WHERE ref_id = ${ref_id} and tid = ${tid}
    );