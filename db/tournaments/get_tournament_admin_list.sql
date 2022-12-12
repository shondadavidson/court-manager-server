--- csv

select name, location, status, start::date, end_date::date, about, description, procedures, referee_approval_required, referee_coordinator_email, certified_amount, level_two_amount, level_one_amount, volunteer_amount, score_reporting,
 (
    select coalesce(json_agg(s), '[]'::json)
                from (  
                    select first, last
                    from tournament_auth a
                    left join referee r
                    on a.ref_id = r.ref_id
                    where t.tid = a.tid
                    order by r.last, r.first
                ) s
            ) as admins

from tournament t where organization = ${org}
order by start
