-- update court_assignments 
--     set start_time = now(), on_court = false
-- where court_num = ${court_num} and tid = ${tid};



    with rows as (
insert into court_assignments (
    tid,
    court_num,
    ref_id,
    start_time,
    on_court,
    medal,
    sysid, paid, amount, ref_cred)
    values (${tid}, ${court_num}, ${ref_id}, now(), true, ${medal}, ${sysid}, ${paid}, ${amount}, ${credentials})

    returning id)

    update courts 
    set ref_id = ${ref_id},
    start_time = now(),
    medal = ${medal},
    current_match = (select id from rows)
where court_num = ${court_num
} and tournament_id = ${tid};

update ref_signup
    set on_court = true,
    court_num = ${court_num},
    side_queue = false
    where ref_id = ${ref_id} and tid = ${tid};

select cid, court_name, c.court_num, c.color, a.ref_id, first, last, id, credentials, credentials_verified,  a.medal, gold, COALESCE(sysid, '') as sysid, c.start_time,paid, amount, second_paid, second_amount,
( 
select *
            from (
                select last_match
                from ref_signup a 
                where r.ref_id = a.ref_id and tid= ${tid}
                limit 1
            ) s
        ) as last_match,
    (select COALESCE(concat(first, ' ', last),'') as second from referee where ref_id = c.second_ref and c.tournament_id = ${tid}),
    (select distinct(last_match) as second_lm from ref_signup s where ref_id = c.second_ref and s.tid = ${tid}),
    (select distinct(credentials) as second_cred from referee s where ref_id = c.second_ref),
    (select distinct(ref_id) as second_ref_id from referee s where ref_id = c.second_ref)

from courts c 
left join referee r 
on c.ref_id = r.ref_id  
left join court_assignments a 
on a.id = c.current_match
where c.tournament_id = ${tid} and c.court_num = ${court_num};


