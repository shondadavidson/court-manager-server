update match
set status = 'recorded', score_input_time = now()
where match_id = ${match_id};

select * ,
(
select coalesce(json_agg(s), '[]'::json)
            from (
                select r.ref_id, r.first, r.last,
                
                ( 
select *
            from (
                select barcode
                from ref_signup a
                where r.ref_id = a.ref_id and tid= ${tid}
            ) s
        ) as barcode
            
                from court_assignments a
                left join referee r
                on r.ref_id = a.ref_id
                where a.court_num = m.court_num and tid= ${tid} and a.on_court = true
            ) s
        ) as ref 

from match m
where tournament_id = ${tid} and status = 'submitted'