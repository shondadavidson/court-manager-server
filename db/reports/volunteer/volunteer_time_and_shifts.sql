select v.ref_id, first || ' '|| last as name,
COALESCE(sum(s.end_time - s.start_time), '0') as total,
(select COALESCE(sum(total_time), '0') from volunteer_time_log where tid = ${tid} and ref_id = v.ref_id and type = 'volunteer') as total_time,
(select coalesce(json_agg(s), '[]'::json)
                from (
                    select COALESCE(to_char((end_time - start_time), ' HH:MI'), '00:00') as hours, 
                        (select name from volunteer_category where vcid = x.vcid) as category,
                        x.name,
                        COALESCE(
                        to_char( start_time AT TIME ZONE (select time_zone from tournament where tid = ${tid}), 'Dy MM/DD HH:MI am'), '') as start,
                        COALESCE(
                        to_char( end_time AT TIME ZONE (select time_zone from tournament where tid = ${tid}), 'HH:MI am'), '') as end
                        from shift_spots xx 
                        left join shift x 
                        on x.sid = xx.sid 
                        where xx.tid = ${tid} and category = 'other' and xx.ref_id = v.ref_id
                        order by last, first, start_time 
                ) s
            ) as detail,
            (select coalesce(json_agg(s), '[]'::json)
                from (
                    select COALESCE(
                        to_char( checkin AT TIME ZONE (select time_zone from tournament where tid = ${tid}), 'Dy MM/DD HH:MI am'), '') as start,
                        COALESCE(
                        to_char( checkout AT TIME ZONE (select time_zone from tournament where tid = ${tid}), 'HH:MI am'), '') as end,
                        total_time
                        from volunteer_time_log 
                        where type = 'volunteer' and tid = ${tid} and ref_id = v.ref_id
                        order by checkin
                ) s
            ) as actual
from volunteer_signup v
left join shift_spots ss 
on ss.ref_id = v.ref_id
left join shift s 
on s.sid = ss.sid
left join referee r 
on v.ref_id = r.ref_id
where v.tid = ${tid} and s.tid = ${tid} and s.category = 'other' 
group by v.ref_id, first, last
order by last, first;