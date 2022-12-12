select * 
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
            ) as shifts
            from referee r
join ref_signup s on s.ref_id = r.ref_id
where s.tid = ${tid}
order by r.last, r.first;