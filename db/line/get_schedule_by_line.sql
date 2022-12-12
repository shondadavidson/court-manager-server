select r.ref_id, r.first, r.last, r.email, r.phone, r.credentials
    , (
    select coalesce(json_agg(s), '[]'::json)
                from (  
                    select t.name, s.referee, s.waitlist, s.line_judge,t.category
                    from shift_spots s
                    left join shift t
                    on t.sid = s.sid
                    where s.tid = ${tid} and r.ref_id = s.ref_id and category = 'Line Judge'
                    order by t.name
                ) s
            ) as shift
            
  
from referee r
where exists (
select 1
from line_signup ls
where tid = ${tid} and r.ref_id = ls.ref_id)
order by r.last, r.first