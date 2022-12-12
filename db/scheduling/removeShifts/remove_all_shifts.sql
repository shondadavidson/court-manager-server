insert into shift_spots_backup (shift_id, tid, sid, ref_id, signup_time, referee, waitlist, line_judge)
select shift_id, tid, sid, ref_id, signup_time, referee, waitlist, line_judge from shift_spots where ref_id = ${ref_id} and tid = ${tid};

delete from shift_spots where ref_id = ${ref_id} and tid = ${tid};