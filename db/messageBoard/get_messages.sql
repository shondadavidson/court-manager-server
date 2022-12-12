select id, m.ref_id, message , first || ' '|| last as name, phone, email,
to_char(post_time AT TIME ZONE (select time_zone from tournament where tid = ${tid}), 'MM/DD HH12:MI am') as post_time
from message_board m 
left join referee r 
on r.ref_id = m.ref_id
where m.tid = ${tid} and category = ${category}
order by post_time;
