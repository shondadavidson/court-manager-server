select tid ,
(
    select coalesce(json_agg(s), '[]'::json)
                    from (
                    select court_num from courts c
                    where tournament_id  = ${tid} and c.court_order <= ${limit}
                    order by c.court_order, c.court_num
                ) s
            ) as left,
            (
    select coalesce(json_agg(s), '[]'::json)
                from (
                    select court_num 
                    from courts c
                    where tournament_id  = ${tid} and c.court_order > ${limit}
                    order by c.court_order, c.court_num
                ) s
            ) as right
from tournament where tid = ${tid}