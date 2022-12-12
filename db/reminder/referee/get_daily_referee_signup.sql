select ss.waitlist, s.name as shift, first || ' '|| last as referee, credentials,
to_char(((signup_time AT TIME ZONE 'UTC') AT TIME ZONE COALESCE((select time_zone from tournament where tid = s.tid ), 'US/Mountain')), 'MM/DD HH12:MI am') as time
from shift_spots ss 
left join shift s 
on s.sid = ss.sid 
left join referee r 
on r.ref_id = ss.ref_id 
where signup_time::date = (NOW()::date - INTERVAL '1 DAY') and s.category = 'Referee'
and ss.tid = ${tid}
order by ss.signup_time;