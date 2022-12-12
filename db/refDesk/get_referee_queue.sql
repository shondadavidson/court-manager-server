select count(*) as in_queue,
(
select * from
            (
                select queue
                from tournament
                where tid = ${tid}
            ) s
        ) as queue_min
from ref_signup
where tid = ${tid} and status and  not on_court and not side_queue;