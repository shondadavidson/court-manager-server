insert into shift_spots_backup (shift_id, tid, sid, ref_id, signup_time, referee, waitlist, line_judge)
select shift_id, tid, sid, ref_id, signup_time, referee, waitlist, line_judge from shift_spots where shift_id = ${shift_id};

delete from shift_spots
where shift_id = ${shift_id};