select n.name, n.start, n.end_date, n.location, n.tid
    , (
    select coalesce(json_agg(s), '[]'::json)
                from (  
                    select  COALESCE(t.name, '') as shift_name, COALESCE((select name from volunteer_category where vcid = t.vcid ) , t.category, '')as category,
                    
                    to_char((t.start_time  AT TIME ZONE (select time_zone from tournament where tid = n.tid)), 'MM/DD DY HH12:MI am') as start_time,
                    
                    to_char((t.end_time AT TIME ZONE (select time_zone from tournament where tid = n.tid)), 'HH12:MI am') as end_time
 

                    from shift_spots ss
                    left join shift t 
                    on t.sid = ss.sid
                    where  ss.ref_id  = 1
                    and t.tid = n.tid
                    order by t.start_time
                ) s
            ) as shift
            
   
from tournament n
where exists ( 
select 1
from shift_spots s
where ref_id = ${ref_id} and tid = n.tid)
order by n.start
