select shift_id from shift_spots ss
left join shift s 
on ss.sid = s.sid
where ref_id = ${ref_id} and s.tid = ${tid} and category = 'other'