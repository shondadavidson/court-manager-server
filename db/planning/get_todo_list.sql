select *, 
(
    select coalesce(json_agg(s), '[]'::json)
        
                from (  
                    select pid, category_id, budget_title, todo_title, contact, contact_phone, contact_email, item_notes, completed, due_date, budget, todo, cid
                    
                    ,(
        select coalesce(json_agg(s), '[]'::json)
                from (  
                    select *
                    from planning_detail d
                    where d.pid = i.pid
                    order by title
                ) s
            ) as detail
                    
                    ,(
        select coalesce(json_agg(s), '[]'::json)
                from (  
                    select a.ref_id, first, last, pa
                    from planning_assignment a
                    
                    left join referee r 
                    on a.ref_id = r.ref_id
                    where a.pid = i.pid
                    order by first, last
                ) s
            ) as names
                    
                    from planning_item i 
                    where i.cid = c.cid and todo = true
                    order by todo_title
                ) s
            ) as items
from category c
where tid = ${tid}
order by category;