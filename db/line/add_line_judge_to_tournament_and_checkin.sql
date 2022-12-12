insert into line_signup (ref_id, tid, end_time)

    SELECT ${ref_id},  ${tid}, now()
WHERE
    NOT EXISTS (
        SELECT ref_id FROM line_signup WHERE ref_id = ${ref_id}  and tid = ${tid}
    );

update line_signup
    set status = true
    where ref_id = ${ref_id}  and tid = ${tid};