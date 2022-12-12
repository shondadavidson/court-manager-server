DELETE FROM
    ref_signup a
        USING ref_signup b
WHERE 
    a.rsid < b.rsid
    AND a.ref_id = b.ref_id and a.tid = b.tid;

DELETE FROM
    line_signup a
        USING line_signup b
WHERE 
    a.rsid < b.rsid
    AND a.ref_id = b.ref_id and a.tid = b.tid;

DELETE FROM
    volunteer_signup a
        USING volunteer_signup b
WHERE 
    a.rsid < b.rsid
    AND a.ref_id = b.ref_id and a.tid = b.tid;