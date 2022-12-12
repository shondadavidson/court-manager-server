select vid, name, color , 
(
    select coalesce(json_agg(s), '[]'::json)
                from (  
                    select *
                    from venue_item i
                    where i.vid = v.vid and show = true
                    order by list_order, title
                ) s
            ) as list
from venue v
where tid = ${tid} and show = true
order by name;
