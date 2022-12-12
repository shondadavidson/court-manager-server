

select name, location, start, end_date
    , (
    select coalesce(json_agg(s), '[]'::json)
                from (
                    select count(*) as count,to_char(start_time, 'MM DD YYYY') as day 
                    from court_assignments 
                    where tid = ${tid}; 
                    group by day order by count desc
                ) s
            ) as match_count
            , (
    select coalesce(json_agg(s), '[]'::json)
                from (
                    select count(*) as count,to_char(start_time, 'MM DD YYYY') as day 
                    from court_assignments 
                    where tid = ${tid}; and medal = 'Gold'
                    group by day order by count desc
                ) s
            ) as gold_count
            , (
    select coalesce(json_agg(s), '[]'::json)
                from (
                    select count(*) as count,to_char(start_time, 'MM DD YYYY') as day 
                    from court_assignments 
                    where tid = ${tid}; and medal = 'Bronze'
                    group by day order by count desc
                ) s
            ) as bronze_count
            , (
    select coalesce(json_agg(s), '[]'::json)
                from (
                    select count(*) as count,to_char(start_time, 'MM DD YYYY') as day 
                    from court_assignments c
                    left join referee r
                    on c.ref_id = r.ref_id
                    where tid = ${tid}; and credentials = 'Certified'
                    group by day order by count desc
                ) s
            ) as certified_count
            , (
    select coalesce(json_agg(s), '[]'::json)
                from (
                    select count(*) as count,to_char(start_time, 'MM DD YYYY') as day 
                    from court_assignments c
                    left join referee r
                    on c.ref_id = r.ref_id
                    where tid = ${tid}; and credentials = 'Level 2'
                    group by day order by count desc
                ) s
            ) as level_two_count
            , (
    select coalesce(json_agg(s), '[]'::json)
                from (
                    select count(*) as count,to_char(start_time, 'MM DD YYYY') as day 
                    from court_assignments c
                    left join referee r
                    on c.ref_id = r.ref_id
                    where tid = ${tid}; and credentials = 'Level 1'
                    group by day order by count desc
                ) s
            ) as level_one_count
            , (
    select coalesce(json_agg(s), '[]'::json)
                from (
                    select count(*) as count,to_char(start_time, 'MM DD YYYY') as day 
                    from court_assignments c
                    left join referee r
                    on c.ref_id = r.ref_id
                    where tid = ${tid}; and credentials = 'Not Rated'
                    group by day order by count desc
                ) s
            ) as volunteer_count
            
 
from tournament t
where tid = ${tid};