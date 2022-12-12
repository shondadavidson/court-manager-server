select r.ref_id, first, last, credentials, last_match

, (
    select coalesce(json_agg(s), '[]'::json)
                from (  
                    select t.name,
                        (select exists(select 1 from shift_spots ss where t.sid = ss.sid and r.ref_id = ss.ref_id and waitlist = false) 
                        ) as registered,
                        (select exists(select 1 from shift_spots ss where t.sid = ss.sid and r.ref_id = ss.ref_id and waitlist = true) 
                        ) as waitlist
                     
                    from shift t
                    
                    where  r.ref_id = s.ref_id and category = 'Referee' and t.tid = ${tid}
                    order by t.name
                ) s
            ) as shift
from ref_signup s
left join referee r
on r.ref_id = s.ref_id
where s.tid = ${tid}
order by r.last, r.first;