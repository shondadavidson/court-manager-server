select r.ref_id, r.first, r.last, r.credentials
    , (
    select coalesce(json_agg(s), '[]'::json)
                from (  
                    select t.name, s.referee, s.waitlist, s.line_judge
                    from shift_spots s
                    left join shift t
                    on t.sid = s.sid
                    where s.tid = ${tid} and r.ref_id = s.ref_id
                    order by t.name
                ) s
            ) as shift
            
  
from referee r
where exists (
select 1
from shift_spots s
where tid = ${tid} and r.ref_id = ${ref_id});