select a.court_num, a.ref_id, a.end_time, first, last, sysid, 
(
select *
            from (
                select barcode
                from ref_signup s
                where s.ref_id = a.ref_id and tid= ${tid}
                limit 1
            ) s 
        ) as barcode
from  court_assignments a
left join referee r 
on r.ref_id = a.ref_id
where tid = ${tid} and end_time is not null
order by a.end_time desc
limit 10;

-- select * from ref_signup