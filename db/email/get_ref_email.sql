select ref_id, first, last, credentials, email
, (
    select coalesce(json_agg(s), '[]'::json)
                from (  
                    select t.name, t.category
                    from shift_spots s
                    left join shift t
                    on t.sid = s.sid
                    where s.tid = ${tid} and r.ref_id = s.ref_id
                    order by t.name
                ) s
            ) as shift
 from referee r
where ref_id = ${ref_id};