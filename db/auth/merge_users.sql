insert into referee_backup (ref_id, first, last, phone, alt_phone, email, credentials, credentials_verified)
select ref_id, first, last, phone, alt_phone, email, credentials, credentials_verified from referee where ref_id = ${merge};

update referee_backup
    set new_ref_id = ${keep}
    where ref_id = ${merge};

update shift_spots
    set ref_id = ${keep}
    where ref_id = ${merge};

update shift_spots_backup
    set ref_id = ${keep}
    where ref_id = ${merge};

update court_assignments 
    set ref_id = ${keep}
    where ref_id = ${merge};

update ref_signup
    set ref_id = ${keep}
    where ref_id = ${merge};

update line_signup
    set ref_id = ${keep}
    where ref_id = ${merge};

update line_assignments
    set ref_id = ${keep}
    where ref_id = ${merge};

update volunteer_signup
    set ref_id = ${keep}
    where ref_id = ${merge};

update recap
    set ref_id = ${keep}
    where ref_id = ${merge};

update email_templates
    set ref_id = ${keep}
    where ref_id = ${merge};

update volunteer_auth
    set ref_id = ${keep}
    where ref_id = ${merge};

update courts
    set ref_id = ${keep}
    where ref_id = ${merge};

delete from referee
where ref_id = ${merge};

DELETE FROM
    ref_signup a
        USING ref_signup b
WHERE 
    a.rsid < b.rsid
    AND a.ref_id = b.ref_id and a.tid = b.tid;

-- DELETE FROM
--     line_signup a
--         USING line_signup b
-- WHERE 
--     a.rsid < b.rsid
--     AND a.ref_id = b.ref_id and a.tid = b.tid;

-- DELETE FROM
--     volunteer_signup a
--         USING volunteer_signup b
-- WHERE 
--     a.rsid < b.rsid
--     AND a.ref_id = b.ref_id and a.tid = b.tid;