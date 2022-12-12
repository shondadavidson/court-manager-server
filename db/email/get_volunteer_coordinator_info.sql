select first, last, email
, (
    select volunteer_coordinator_email
                from (  
                    select volunteer_coordinator_email
                    from tournament
                    where tid = ${tid}
                ) s
            ) as coordinator_email, (
    select name
                from (  
                    select name
                    from tournament
                    where tid = ${tid}
                ) s
            ) as tournament_name
from referee
where ref_id = ${ref_id};