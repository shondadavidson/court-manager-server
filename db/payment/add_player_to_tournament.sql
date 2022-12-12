insert into payout
(ref_id, tid)
  
SELECT ${ref_id}, ${tid}
WHERE
    NOT EXISTS (
        SELECT ref_id, tid FROM payout WHERE ref_id = ${ref_id} and tid = ${tid}
    );

