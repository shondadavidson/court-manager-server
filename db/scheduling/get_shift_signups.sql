select shift_id, s.sid, ref_id, signup_time, waitlist, line_judge, s.tid, referee, name
from shift_spots s 
left join shift x 
on x.sid = s.sid
where s.sid = ${sid};