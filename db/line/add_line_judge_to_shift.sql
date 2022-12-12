insert into line_signup (ref_id, tid, end_time, status)

    SELECT ${ref_id},  ${tid}, now(), true
WHERE
    NOT EXISTS (
        SELECT ref_id FROM line_signup WHERE ref_id = ${ref_id}  and tid = ${tid}
    );

insert into shift_spots (ref_id, sid, tid, signup_time)
  
SELECT ${ref_id}, ${sid}, ${tid}, now()
WHERE
    NOT EXISTS (
        SELECT ref_id, sid FROM shift_spots WHERE ref_id = ${ref_id} and sid = ${sid} 
    );
