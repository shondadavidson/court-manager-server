select c.court_num, c.ref_id, COALESCE(c.start_time::TEXT,'0') as start_time, c.current_match, r.first, r.last, r.phone, r.email, r.credentials, r.credentials_verified, 
c.start_time,
(select COALESCE(concat(first, ' ', last),'') as second from referee where ref_id = c.second_ref and c.tournament_id = ${tid}),
(select distinct(last_match) as second_lm from ref_signup s where ref_id = c.second_ref and s.tid = ${tid}),
(select distinct(credentials) as second_cred from referee s where ref_id = c.second_ref),
( 
select *
            from (
                select last_match
                from ref_signup a 
                where r.ref_id = a.ref_id and tid= ${tid}
                limit 1
            ) s
        ) as last_match, 
            ( 
select *
            from (
                select a.medal
                from court_assignments a  
                where c.current_match = a.id and tid= ${tid}
                limit 1
            ) s
        ) as medal
        
from courts c 
    left join referee r
    on c.ref_id = r.ref_id

where tournament_id = ${tid}
order by c.court_order, c.court_num;