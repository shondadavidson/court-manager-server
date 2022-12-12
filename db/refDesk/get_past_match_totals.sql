select tid 
, (
select *
            from (
                select count(*)
                from court_assignments a
                 left join referee r on r.ref_id = a.ref_id
                where tid = ${tid} and r.credentials = 'Certified'
            ) s
        ) as certified,
        (
select *
            from (
                select count(*)
                from court_assignments a
                 left join referee r on r.ref_id = a.ref_id
                where tid = ${tid} and r.credentials = 'Level 2'
            ) s
        ) as level_two,
        (
select *
            from (
                select count(*)
                from court_assignments a
                 left join referee r on r.ref_id = a.ref_id
                where tid = ${tid} and r.credentials = 'Level 1'
            ) s
        ) as level_one,
        (
select *
            from (
                select count(*)
                from court_assignments a
                 left join referee r on r.ref_id = a.ref_id
                where tid = ${tid} and (r.credentials = 'Not Rated' or r.credentials = 'none')
            ) s
        ) as volunteer,
        (
select *
            from (
                select count(*)
                from court_assignments a
                 left join referee r on r.ref_id = a.ref_id
                where tid = ${tid} 
            ) s
        ) as total
            

from tournament where tid = ${tid}
limit 1