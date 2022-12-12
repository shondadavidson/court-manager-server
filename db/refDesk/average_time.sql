SELECT TID,

(

select count(*) as certified_count
                from court_assignments a
                 left join referee r on r.ref_id = a.ref_id
                where tid = ${tid} and r.credentials = 'Certified' and a.medal != 'Gold' and a.medal != 'Bronze' 
                ),
                
(select sum((end_time - start_time))/ count(*) as avg_certified
                from court_assignments a
                 left join referee r on r.ref_id = a.ref_id
                where tid = ${tid} and r.credentials = 'Certified' and a.medal != 'Gold' and a.medal != 'Bronze' 

),
(select sum((end_time - start_time)) as certified_time
                from court_assignments a
                 left join referee r on r.ref_id = a.ref_id
                where tid = ${tid} and r.credentials = 'Certified' and a.medal != 'Gold' and a.medal != 'Bronze'
                ),
(

select count(*) as level_two_count
                from court_assignments a
                 left join referee r on r.ref_id = a.ref_id
                where tid = ${tid} and r.credentials = 'Level 2' and a.medal != 'Gold' and a.medal != 'Bronze' 
                ),
                
(select sum((end_time - start_time))/ count(*) as avg_level_two
                from court_assignments a
                 left join referee r on r.ref_id = a.ref_id
                where tid = ${tid} and r.credentials = 'Level 2' and a.medal != 'Gold' and a.medal != 'Bronze' 

),
(select sum((end_time - start_time)) as level_two_time
                from court_assignments a
                 left join referee r on r.ref_id = a.ref_id
                where tid = ${tid} and r.credentials = 'Level 2' and a.medal != 'Gold' and a.medal != 'Bronze'
                ),
(

select count(*) as level_one_count
                from court_assignments a
                 left join referee r on r.ref_id = a.ref_id
                where tid = ${tid} and r.credentials = 'Level 1' and a.medal != 'Gold' and a.medal != 'Bronze' 
                ),
                
(select sum((end_time - start_time))/ count(*) as avg_level_one
                from court_assignments a
                 left join referee r on r.ref_id = a.ref_id
                where tid = ${tid} and r.credentials = 'Level 1' and a.medal != 'Gold' and a.medal != 'Bronze' 

),
(select sum((end_time - start_time)) as level_one_time
                from court_assignments a
                 left join referee r on r.ref_id = a.ref_id
                where tid = ${tid} and r.credentials = 'Level 1' and a.medal != 'Gold' and a.medal != 'Bronze'
                ),
(

select count(*) as volunteer_count
                from court_assignments a
                 left join referee r on r.ref_id = a.ref_id
                where tid = ${tid} and r.credentials = 'Not Rated' and a.medal != 'Gold' and a.medal != 'Bronze' 
                ),
                
(select sum((end_time - start_time))/ count(*) as avg_volunteer
                from court_assignments a
                 left join referee r on r.ref_id = a.ref_id
                where tid = ${tid} and r.credentials = 'Not Rated' and a.medal != 'Gold' and a.medal != 'Bronze' 

),
(select sum((end_time - start_time)) as volunteer_time
                from court_assignments a
                 left join referee r on r.ref_id = a.ref_id
                where tid = ${tid} and r.credentials = 'Not Rated' and a.medal != 'Gold' and a.medal != 'Bronze'
                ),
(

select count(*) as total_count
                from court_assignments a
                 left join referee r on r.ref_id = a.ref_id
                where tid = ${tid} and a.medal != 'Gold' and a.medal != 'Bronze' 
                ),
                
(select sum((end_time - start_time))/ count(*) as avg_total
                from court_assignments a
                 left join referee r on r.ref_id = a.ref_id
                where tid = ${tid} and a.medal != 'Gold' and a.medal != 'Bronze' 

),
(select sum((end_time - start_time)) as total_time
                from court_assignments a
                 left join referee r on r.ref_id = a.ref_id
                where tid = ${tid}  and a.medal != 'Gold' and a.medal != 'Bronze'
                )
                
from tournament where tid = ${tid}