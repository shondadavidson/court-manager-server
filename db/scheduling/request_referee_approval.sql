insert into volunteer_auth (tid, ref_id, referee_request, referee_request_note, referee_approved, request_time)
SELECT ${tid}, ${ref_id}, true, ${referee_request_note}, null, now()
WHERE
    NOT EXISTS (
        SELECT tid, ref_id FROM volunteer_auth WHERE tid = ${tid} and ref_id = ${ref_id} 
    );

select name, send_email, test, referee_coordinator_email,
(
select * from
            (
                select first || ' '|| last
                from referee
                where ref_id = ${ref_id}
            ) s
        ) as referee,
        (
select * from
            (
                select email
                from referee
                where ref_id = ${ref_id}
            ) s
        ) as email,
        (
select * from
            (
                select phone
                from referee
                where ref_id = ${ref_id}
            ) s
        ) as phone

from tournament
where tid = ${tid};