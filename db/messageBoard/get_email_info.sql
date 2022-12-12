select id, message , first || ' '|| last as name, phone, email,
(select name from tournament where tid = m.tid) as tournament,
(select email from referee where ref_id = ${from}) as from_email,
(select first || ' '|| last from referee where ref_id = ${from}) as from_name
from message_board m 
left join referee r 
on r.ref_id = m.ref_id
where id = ${id};