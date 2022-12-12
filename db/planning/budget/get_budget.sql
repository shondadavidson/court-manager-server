select * ,
(
    select coalesce(json_agg(s), '[]'::json)
                from (  
                    select *
                    from planning_item i 
                    where i.category_id = c.category_id and budget = true and tid = ${tid}
                    order by budget_title
                ) s
            ) as items
from budget_category c
order by sort;