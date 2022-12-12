insert into shift_spots (ref_id, sid, tid, signup_time, waitlist)
  
SELECT ${ref_id}, ${sid}, ${tid}, now(), ${waitlist}
WHERE
    NOT EXISTS (
        SELECT ref_id, sid FROM shift_spots WHERE ref_id = ${ref_id} and sid = ${sid} and tid = ${tid}
    );

select r.ref_id, s.tid, first || ' '|| last as name, email,
COALESCE((select name from volunteer_category where vcid = s.vcid), s.category, '') as category, s.name as shift, t.name as tournament_name, status, send_email, test,
COALESCE(
                        to_char( start_time AT TIME ZONE (select time_zone from tournament where tid = ${tid}), 'Dy MM/DD HH:MI am'), '') as start,
                        COALESCE(
                        to_char( end_time AT TIME ZONE (select time_zone from tournament where tid = ${tid}), 'HH:MI am'), '') as end
from referee r 
left join shift_spots ss 
on r.ref_id = ss.ref_id
left join shift s 
on s.sid = ss.sid
left join tournament t 
on t.tid = s.tid
where r.ref_id = ${ref_id} and s.sid = ${sid};
