select r.ref_id, COALESCE(last || ', ' ||first, '') as name, 
COALESCE((SUBSTRING(phone, 1, 3) ||'-'||SUBSTRING(phone, 4, 3)|| '-' || SUBSTRING(phone, 7, 4)  ), '') as phone, COALESCE((SUBSTRING(alt_phone, 1, 3) ||'-'||SUBSTRING(alt_phone, 4, 3)|| '-' || SUBSTRING(alt_phone, 7, 4)  ),'') as alt_phone,
 email,

(
    select coalesce(json_agg(s), '[]'::json)
                from (  
                    select  COALESCE(t.name, '') as shift_name, COALESCE((select name from volunteer_category where vcid = t.vcid ) , t.category, '')as category,
                    
                    COALESCE(to_char((t.start_time  AT TIME ZONE (select time_zone from tournament where tid = ${tid})), 'MM/DD DY HH12:MI am'), '') as start_time,
                    
                    COALESCE(to_char((t.end_time AT TIME ZONE (select time_zone from tournament where tid = ${tid})), 'HH12:MI am'), '') as end_time, waitlist


                    from shift_spots s
                    left join shift t
                    on t.sid = s.sid
                    where s.tid = s.tid and r.ref_id = s.ref_id and r.ref_id is not null
                    and t.category = 'Referee'
                    and t.tid = ${tid}
                    order by t.start_time
                ) s  
            ) as shift


from ref_signup vs  
left join referee r 
on vs.ref_id = r.ref_id
where vs.tid = ${tid} and r.ref_id is not null
group by r.ref_id
order by r.last, r.first