select s.ref_id, first || ' '|| last as name,
(select COALESCE(sum(total_time), '0') from volunteer_time_log where tid = ${tid} and ref_id = s.ref_id and type = 'referee') as total_time,
            (select coalesce(json_agg(s), '[]'::json)
                from (
                    select COALESCE(
                        to_char( checkin AT TIME ZONE (select time_zone from tournament where tid = ${tid}), 'Dy MM/DD HH:MI am'), '') as start,
                        COALESCE(
                        to_char( checkout AT TIME ZONE (select time_zone from tournament where tid = ${tid}), 'HH:MI am'), '') as end,
                        total_time
                        from volunteer_time_log 
                         where type = 'referee' and tid = ${tid} and ref_id = s.ref_id
                        order by checkin
                ) s
            ) as actual
from ref_signup s 
left join referee r 
on s.ref_id = r.ref_id
where s.tid = ${tid}
group by s.ref_id, first, last
order by last, first;