select tid ,
(
    select coalesce(json_agg(s), '[]'::json)
                from (
                    select c.court_num, line_group, l.group_name, l.gid, l.color, c.medal
from courts c
left join line_groups l
on l.gid = c.line_group 
where tournament_id  = ${tid} and c.court_order <= ${limit}
order by c.court_order, c.court_num
                ) s
            ) as left,
            (
    select coalesce(json_agg(s), '[]'::json)
                from (
                    select c.court_num, line_group, l.group_name, l.gid, l.color, c.medal
from courts c
left join line_groups l
on l.gid = c.line_group 
where tournament_id  = ${tid} and c.court_order > ${limit}
order by c.court_order, c.court_num
                ) s
            ) as right


from tournament where tid = ${tid}