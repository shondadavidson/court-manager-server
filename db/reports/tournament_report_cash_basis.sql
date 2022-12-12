

select name, location, start, end_date, certified_amount, level_two_amount, level_one_amount, volunteer_amount,
(select count(*)
            from (
                select ref_id
                from court_assignments
                where tid= ${tid}
            ) s
        ) as total_matches,
        (select count(*) 
            from (
                select ref_id
                from court_assignments
                where tid= ${tid} and medal = 'Gold'
            ) s
        ) as total_gold, 
        (select count(*)
            from (
                select ref_id
                from court_assignments
                where tid= ${tid} and medal = 'Gold' and match_type = 'tie-breaker'
            ) s
        ) as total_gold_tiebreak, 
        (select count(*)
            from (
                select ref_id
                from court_assignments
                where tid= ${tid} and medal = 'Bronze'
            ) s
        ) as total_bronze, 
        (select count(*)
            from (
                select c.ref_id
                from court_assignments c
                left join referee r 
                on r.ref_id = c.ref_id
                where tid= ${tid} and credentials = 'Certified'
            ) s
        ) as total_certified, 
        (select *
            from (
                select (sum(amount) + sum(second_amount))
                from court_assignments c
                left join referee r 
                on r.ref_id = c.ref_id
                where tid= ${tid} and credentials = 'Certified' 
            ) s
        ) as total_cert_payments,
        (select count(*)
            from (
                select c.ref_id
                from court_assignments c
                left join referee r 
                on r.ref_id = c.ref_id
                where tid= ${tid} and credentials = 'Level 2'
            ) s
        ) as total_level_two,
        (select *
            from (
                select (sum(amount) + sum(second_amount))
                from court_assignments c
                left join referee r 
                on r.ref_id = c.ref_id
                where tid= ${tid} and credentials = 'Level 2'
            ) s
        ) as total_2_payments,
        (select count(*)
            from (
                select c.ref_id
                from court_assignments c
                left join referee r 
                on r.ref_id = c.ref_id
                where tid= ${tid} and credentials = 'Level 1'
            ) s
        ) as total_level_one,
        (select *
            from (
                select (sum(amount) + sum(second_amount))
                from court_assignments c
                left join referee r 
                on r.ref_id = c.ref_id
                where tid= ${tid} and credentials = 'Level 1' 
            ) s
        ) as total_1_payments,
        (select count(*)
            from (
                select c.ref_id
                from court_assignments c
                left join referee r 
                on r.ref_id = c.ref_id
                where tid= ${tid} and credentials = 'Not Rated'
            ) s
        ) as total_volunteer,
        (select *
            from (
                select (sum(amount) + sum(second_amount))
                from court_assignments c
                left join referee r 
                on r.ref_id = c.ref_id
                where tid= ${tid} and credentials = 'Not Rated' 
            ) s
        ) as total_vol_payments,
        (select count(*)
            from (
                select c.second_ref
                from court_assignments c
                left join referee r 
                on r.ref_id = c.ref_id
                where tid= ${tid} and second_ref is not null
            ) s
        ) as total_second_referee,
        (select *
            from (
                select sum(second_amount)
                from court_assignments c
                left join referee r 
                on r.ref_id = c.ref_id
                where tid= ${tid} and second_ref is not null 
            ) s
        ) as total_second_referee_payment,
    (
    select coalesce(json_agg(s), '[]'::json)
                from (
                    select count(*) as count,to_char(start_time, 'MM/DD') as day 
                    from court_assignments 
                    where tid = ${tid} 
                    group by start_time::date, day order by start_time::date
                ) s
            ) as match_count
            , (
    select coalesce(json_agg(s), '[]'::json)
                from (
                    select count(*) as count,to_char(start_time, 'MM/DD') as day 
                    from court_assignments 
                    where tid = ${tid} and medal = 'Gold'
                    group by start_time::date, day order by start_time::date
                ) s
            ) as gold_count
             , (
    select coalesce(json_agg(s), '[]'::json)
                from (
                    select count(*) as count,to_char(start_time, 'MM/DD') as day 
                    from court_assignments 
                    where tid = ${tid} and medal = 'Gold' and match_type ='tie-breaker'
                    group by start_time::date, day order by start_time::date
                ) s
            ) as gold_tie_count
            , (
    select coalesce(json_agg(s), '[]'::json)
                from (
                    select count(*) as count,to_char(start_time, 'MM/DD') as day 
                    from court_assignments 
                    where tid = ${tid} and medal = 'Bronze'
                    group by start_time::date, day order by start_time::date
                ) s
            ) as bronze_count
            , (
    select coalesce(json_agg(s), '[]'::json)
                from (
                    select count(*) as count,to_char(start_time, 'MM/DD') as day,
                    (sum(amount) + sum(second_amount)) as certified_payment 
                    from court_assignments c
                    left join referee r
                    on c.ref_id = r.ref_id
                    where tid = ${tid} and credentials = 'Certified'
                    group by start_time::date, day order by start_time::date
                ) s
            ) as certified_count
            , (
    select coalesce(json_agg(s), '[]'::json)
                from (
                    select count(*) as count,to_char(start_time, 'MM/DD') as day,
                    (sum(amount) + sum(second_amount)) as level_two_payment  
                    from court_assignments c
                    left join referee r
                    on c.ref_id = r.ref_id
                    where tid = ${tid} and credentials = 'Level 2'
                    group by start_time::date, day order by start_time::date
                ) s
            ) as level_two_count
            , (
    select coalesce(json_agg(s), '[]'::json)
                from (
                    select count(*) as count,to_char(start_time, 'MM/DD') as day,
                    (sum(amount) + sum(second_amount)) as level_one_payment  
                    from court_assignments c
                    left join referee r
                    on c.ref_id = r.ref_id
                    where tid = ${tid} and credentials = 'Level 1'
                    group by start_time::date, day order by start_time::date
                ) s
            ) as level_one_count
            , (
    select coalesce(json_agg(s), '[]'::json)
                from (
                    select count(*) as count,to_char(start_time, 'MM/DD') as day,
                    (sum(amount) + sum(second_amount)) as volunteer_payment  
                    from court_assignments c
                    left join referee r
                    on c.ref_id = r.ref_id
                    where tid = ${tid} and credentials = 'Not Rated'
                    group by start_time::date, day order by start_time::date
                ) s
            ) as volunteer_count,
            (select *
            from (
                select (sum(bonus))
                from invoice 
                where tid= ${tid}
            ) s
        ) as total_invoiced
            
 
from tournament t
where tid = ${tid};