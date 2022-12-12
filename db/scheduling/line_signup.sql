insert into line_signup 
(ref_id, tid)
  
SELECT ${ref_id}, ${tid}
WHERE
    NOT EXISTS (
        SELECT ref_id, tid FROM line_signup WHERE ref_id = ${ref_id} and tid = ${tid}
    );