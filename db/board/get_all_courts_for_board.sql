select cid, court_name, c.court_num, c.color, a.ref_id, first, last, first || ' '|| last as name, id, credentials, credentials_verified, a.medal, gold, COALESCE(sysid, '') as sysid, c.start_time, paid, amount, second_paid, second_amount, match_starter_name, match_starter_id, 
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
where c.tournament_id = ${tid}
order by court_order