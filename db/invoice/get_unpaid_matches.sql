
select ref_id,
(select coalesce(json_agg(s), '[]'::json)
                from (  
                    select court_num, start_time, end_time, medal, match_type, paid, sysid, amount, posted, payment_note
                    from court_assignments
                    where end_time is not null and paid = false and tid = ${tid} and ref_id = ${ref_id}
                    order by end_time
                ) s
            ) as lead,
            (select coalesce(json_agg(s), '[]'::json)
                from (  
                    select court_num, start_time, end_time, medal, match_type, second_paid as paid, sysid, second_amount as amount, posted, payment_note
                    from court_assignments
                    where end_time is not null and paid = false and tid = ${tid} and second_ref = ${ref_id}
                    order by end_time
                ) s
            ) as support
from referee where ref_id = ${ref_id};