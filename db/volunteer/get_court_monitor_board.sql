select tid ,
(
    select coalesce(json_agg(s), '[]'::json)
                from (
                    select c.court_num, c.monitor_id, r.ref_id, r.first, r.last

from courts c 
left join referee r
on c.monitor_id = r.ref_id

where tournament_id = ${tid} and c.court_order <= ${limit}
order by c.court_order, c.court_num
                ) s
            ) as left,
            (
    select coalesce(json_agg(s), '[]'::json)
                from (
                    select c.court_num, c.monitor_id, r.ref_id, r.first, r.last

from courts c 
left join referee r
on c.monitor_id = r.ref_id

where tournament_id = ${tid} and c.court_order > ${limit}
order by c.court_order, c.court_num
                ) s
            ) as right


from tournament where tid = ${tid}
