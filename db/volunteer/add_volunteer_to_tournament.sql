insert into volunteer_signup (ref_id, tid, end_time)

    SELECT ${ref_id},  ${tid}, now()
WHERE
    NOT EXISTS (
        SELECT ref_id FROM volunteer_signup WHERE ref_id = ${ref_id}  and tid = ${tid}
    );