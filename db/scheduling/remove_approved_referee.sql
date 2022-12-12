update volunteer_auth
set referee_approved = false,
    response = ${note}
where ref_id = ${ref_id} and tid = ${tid};


select name, send_email, test, referee_coordinator_email, status, 
(
select * from
            (
                select first
                from referee
                where ref_id = ${ref_id}
            ) s
        ) as first,
        (
select * from
            (
                select last
                from referee
                where ref_id = ${ref_id}
            ) s
        ) as last,
        (
select * from
            (
                select email
                from referee
                where ref_id = ${ref_id}
            ) s
        ) as email

from tournament
where tid = ${tid};

