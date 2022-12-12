select tid 
, (
select *
            from (
                select count(*)
                from court_assignments a
                 left join referee r on r.ref_id = a.ref_id
                where tid = ${tid} and r.credentials = 'Certified' and (start_time at time zone 'utc' AT TIME ZONE (select time_zone from tournament where tid = ${tid}) )::date = ${day}
            ) s
        ) as certified,
        (
select *
            from (
                select count(*)
                from court_assignments a
                 left join referee r on r.ref_id = a.ref_id
                where tid = ${tid} and r.credentials = 'Level 2' and (start_time at time zone 'utc' AT TIME ZONE (select time_zone from tournament where tid = ${tid}) )::date = ${day}
            ) s
        ) as level_two,
        (
select *
            from (
                select count(*)
                from court_assignments a
                 left join referee r on r.ref_id = a.ref_id
                where tid = ${tid} and r.credentials = 'Level 1' and (start_time at time zone 'utc' AT TIME ZONE (select time_zone from tournament where tid = ${tid}) )::date = ${day}
            ) s
        ) as level_one,
        (
select *
            from (
                select count(*)
                from court_assignments a
                 left join referee r on r.ref_id = a.ref_id
                where tid = ${tid} and (r.credentials = 'Not Rated' or r.credentials = 'none') and (start_time at time zone 'utc' AT TIME ZONE (select time_zone from tournament where tid = ${tid}) )::date = ${day}
            ) s
        ) as volunteer,
        (
select *
            from (
                select count(*)
                from court_assignments a
                 left join referee r on r.ref_id = a.ref_id
                where tid = ${tid} and (start_time at time zone 'utc' AT TIME ZONE (select time_zone from tournament where tid = ${tid}) )::date = ${day}
            ) s
        ) as total
            

from tournament where tid = ${tid}
limit 1



