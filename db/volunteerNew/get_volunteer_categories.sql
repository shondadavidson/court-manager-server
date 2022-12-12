select * ,
(
    select coalesce(json_agg(s), '[]'::json)
                from (  
                    select id, a.ref_id, (first ||' ' ||last) as name
                    from volunteer_category_admin a 
                    left join referee r 
                    on a.ref_id = r.ref_id
                    where vcid = c.vcid
                ) s
            ) as admin
from volunteer_category c
where tid = ${tid}
order by name;