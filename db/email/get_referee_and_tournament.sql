select first, last, email,
(select name
                from (
                    select name
                    from tournament
                    where tid = ${tid}
                ) s
            ) as name
from referee
where ref_id = ${ref_id};