insert into volunteer_time_log (tid, ref_id, type, checkin)  
SELECT ${tid}, ${ref_id}, ${type}, now()
WHERE
    NOT EXISTS (
        SELECT ref_id FROM volunteer_time_log WHERE ref_id = ${ref_id} and tid = ${tid} and checkout is null and type = ${type}
    );