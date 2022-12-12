select r.ref_id, r.first, r.last, r.email, r.phone, r.credentials
    , (
    select coalesce(json_agg(s), '[]'::json)
                from (  
                    select t.name, s.referee, s.waitlist, s.line_judge, s.captain, vcid,
                    COALESCE((select name from volunteer_category where t.vcid = vcid), 'other') as category,
                    to_char(((start_time AT TIME ZONE 'UTC') AT TIME ZONE (select time_zone from tournament where tid = ${tid})), 'MM/DD HH12:MI am') as start_time 
                    from shift_spots s
                    left join shift t
                    on t.sid = s.sid
                    where s.tid = ${tid} and r.ref_id = s.ref_id and category = 'other'
                    order by t.name, captain desc
                ) s
            ) as shift
            
  
from referee r
where exists (
select 1
from volunteer_signup rs
where tid = ${tid} and r.ref_id = rs.ref_id)
order by r.last, r.first