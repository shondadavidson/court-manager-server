insert into tournament_auth (tid, ref_id)  
SELECT ${tid}, ${ref_id}
WHERE
    NOT EXISTS (
        SELECT ref_id FROM tournament_auth WHERE ref_id = ${ref_id} and tid = ${tid}
    );

select first, last, email, 
(
    select name
                from (  
                    select name
                    from tournament where tid = ${tid}
                ) s
            ) as name
from referee 
where ref_id = ${ref_id};