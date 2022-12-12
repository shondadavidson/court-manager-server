select wait_spots as spots, wait_certified as certified, wait_level_two as level_two, wait_level_one as level_one, wait_none as volunteer, s.name as shift_name, category, t.tid, t.name as tournament_name, pre_reg, t.test, t.status,
 (wait_level_two + wait_level_one + wait_none) as level_two_spots, 
(wait_level_one + wait_none) as level_one_spots,
(
select *
            from (
                select count(ref_id)
                from ref_signup
                where tid = ${tid} and ref_id = ${ref_id}
            ) s
        ) as registered_referee,
        (
select *
            from (
                select count(ref_id)
                from line_signup
                where tid = ${tid} and ref_id = ${ref_id}
            ) s
        ) as registered_line,
(
select *
            from (
                select count(sid)
                from shift_spots
                where sid = ${sid} and ref_id = ${ref_id}
            ) s
        ) as already_registered,
(
select *
            from (
                select count(sid)
                from shift_spots
                where sid = ${sid} and waitlist = true 
            ) s
        ) as taken,
        (
select *
            from (
                select count(sid)
                from shift_spots s
                left join referee r on s.ref_id = r.ref_id
                where sid = ${sid} and r.credentials = 'Certified' and waitlist = true
            ) s
        ) as certified_taken,
        (
select *
            from (
                select count(sid)
                from shift_spots s
                left join referee r on s.ref_id = r.ref_id
                where sid = ${sid} and r.credentials = 'Level 2' and waitlist = true
            ) s
        ) as leveltwo_taken,
        (
select *
            from (
                select count(sid)
                from shift_spots s
                left join referee r on s.ref_id = r.ref_id
                where sid = ${sid} and r.credentials = 'Level 1' and waitlist = true
            ) s
        ) as levelone_taken ,
        (
select *
            from (
                select count(sid)
                from shift_spots s
                left join referee r on s.ref_id = r.ref_id
                where sid = ${sid} and r.credentials = 'Not Rated' and waitlist = true
            ) s
        ) as volunteer_taken ,
        
        (
select *
            from (
                select credentials
                from referee
                where ref_id = ${ref_id} 
            ) s
        ) as ref_credential,
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
        ) as email,
        (
select *
            from (
                select count(ref_id)
                from volunteer_auth
                where ref_id = ${ref_id} and tid = ${tid} and referee_approved = true
            ) s
        ) as approved_referee
    
from shift s
left join tournament t
on s.tid = t.tid 
where sid = ${sid};