select  distinct(ss.ref_id)as id, first, last, first || ' '|| last as name,
-- to_char( start_time at time zone (select time_zone from tournament where tid = ${tid}), 'DY MM/DD/YYYY') as day,
-- to_char( start_time, 'MM/DD/YYYY') as date,
-- start_time at TIME ZONE (select time_zone from tournament where tid = s.tid), 

(SUBSTRING(phone, 1, 3) ||'-'||SUBSTRING(phone, 4, 3)|| '-' || SUBSTRING(phone, 7, 4)  ) as cell_phone,
(SUBSTRING(alt_phone, 1, 3) ||'-'||SUBSTRING(alt_phone, 4, 3)|| '-' || SUBSTRING(alt_phone, 7, 4)  ) as other_phone, 
email,
emergency_name, 
(SUBSTRING(emergency_number, 1, 3) ||'-'||SUBSTRING(emergency_number, 4, 3)|| '-' || SUBSTRING(emergency_number, 7, 4)  ) as emergency_number

from shift_spots ss 
left join shift s
on s.sid = ss.sid
left join referee r 
on r.ref_id = ss.ref_id
where s.tid = ${tid} 
and (start_time at TIME ZONE (select time_zone from tournament where tid = ${tid}))::date = ${day}
and category = 'other'
order by last, first