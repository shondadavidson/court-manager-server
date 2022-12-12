select count(*),
(
select ref_id
            from (
                select ref_id
                from referee
                where email ilike ${email}
                limit 1
            ) s
        ) as ref_id,
                exists (
select ref_id
            from (
                select ref_id
                from referee
                where email ilike ${email}
                limit 1
            ) s
        ) as is_ref_id

from user_auth 
where email ilike ${email}; 