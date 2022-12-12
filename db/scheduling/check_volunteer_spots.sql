select spots, wait_spots, s.name as shift_name, category, t.tid, t.name as tournament_name, status, test, 
(
select *
            from (
                select count(ref_id)
                from volunteer_signup
                where tid = ${tid} and ref_id = ${ref_id}
            ) s
        ) as registered_volunteer,
        (
select *
            from (
                select count(sid)
                from shift_spots
                where sid = ${sid} and ref_id = ${ref_id}
            ) s
        ) as already_registered,
        (select exists(select 1 from shift_spots ss where s.sid = ss.sid and ss.ref_id = ${ref_id} and waitlist = true) ) as registered_waitlist,
        (
select shift_id 
            from (
                select shift_id
                from shift_spots
                where sid = ${sid} and ref_id = ${ref_id}
            ) s
        ) as shift_id,

(
select *
            from (
                select count(sid)
                from shift_spots
                where sid = ${sid} and (waitlist = false or waitlist is null)
            ) s
        ) as taken,
        (
select *
            from (
                select count(sid)
                from shift_spots
                where sid = ${sid} and waitlist = true
            ) s
        ) as wait_taken,
        
        
       
 (
select *
            from (
                select first
                from referee
                where ref_id = ${ref_id}
            ) s
        ) as first,
 (
select *
            from (
                select last
                from referee
                where ref_id = ${ref_id}
            ) s
        ) as last,
 (
select *
            from (
                select email
                from referee
                where ref_id = ${ref_id}
            ) s
        ) as email
    
from shift s
left join tournament t
on s.tid = t.tid 
where sid = ${sid};