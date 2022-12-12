insert into shift_spots (ref_id, sid, tid,  waitlist, signup_time)
  
SELECT ${ref_id}, ${sid}, ${tid}, true, now()
WHERE
    NOT EXISTS (
        SELECT ref_id, sid FROM shift_spots WHERE ref_id = ${ref_id} and sid = ${sid} and tid = ${tid}
        and waitlist = true 
    );