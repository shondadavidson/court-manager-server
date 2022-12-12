select c.court_num, c.ref_id, COALESCE(c.start_time::TEXT,'0') as start_time, c.current_match, r.first, r.last, r.phone, r.email, r.credentials, r.credentials_verified,
( 
select *
            from (
                select last_match
                from ref_signup a 
                where r.ref_id = a.ref_id and tid= ${tid}
                limit 1
            ) s
        ) as last_match
        , (
    select coalesce(json_agg(s), '[]'::json)
                from (  
                    select t.name, t.category
                    from shift_spots s
                    left join shift t
                    on t.sid = s.sid
                    where s.tid = ${tid} and r.ref_id = s.ref_id
                    order by t.name
                ) s
            ) as shifts,
            ( 
select *
            from (
                select a.medal
                from court_assignments a  
                where c.current_match = a.id and tid= ${tid}
            ) s
        ) as medal,
        ( 
select *
            from (
                select a.sysid
                from court_assignments a  
                where c.current_match = a.id and tid= ${tid}
            ) s
        ) as sysid
from courts c 
    left join referee r
    on c.ref_id = r.ref_id
    
where tournament_id = ${tid} and c.court_order <= ${limit}
order by c.court_order, c.court_num;