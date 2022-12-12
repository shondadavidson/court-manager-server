insert into court_assignments (
    tid,
    court_num,
    ref_id,
    start_time,
    end_time,
    medal, match_type, 
    sysid, paid, amount, ref_cred, second_ref, second_cred, second_amount, second_paid, match_time, on_court)
    values (${tid}, ${court}, ${ref_id}, now(), now(), ${medal}, ${match_type}, ${sysid}, ${paid}, ${amount}, ${credentials},
    ${secondRef}, ${secondCred},
    ${secondAmount},
    ${secondPaid}, 0, false
    );