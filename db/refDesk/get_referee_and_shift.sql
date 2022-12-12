select t.tid, t.name as tournament_name, s.name as shift_name,category, 
( select *
            from (
                select last
                from referee r
                where r.ref_id  = ${ref_id}
                
            ) r
        ) as last,
        ( select *
            from (
                select first
                from referee r
                where r.ref_id  = ${ref_id}
                
            ) r
        ) as first,
        ( select *
            from (
                select email
                from referee r
                where r.ref_id  = ${ref_id}
                
            ) r
        ) as email

from shift  s 
left join tournament t
on s.tid = t.tid
where sid = ${sid};