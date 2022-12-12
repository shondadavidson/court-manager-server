select vcid from 
shift_spots ss 
left join shift s 
on ss.sid = s.sid
where s.vcid  = ${vcid};