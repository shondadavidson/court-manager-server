insert into volunteer_auth (tid, ref_id, referee_approved)
  
SELECT ${tid}, ${ref_id} , true
WHERE
    NOT EXISTS (
        SELECT tid, ref_id FROM volunteer_auth WHERE tid = ${tid} and ref_id = ${ref_id} 
    );

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

