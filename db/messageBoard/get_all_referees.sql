select first || ' '|| last as referee, email 
from ref_signup s 
left join referee r 
on r.ref_id = s.ref_id 
where tid = ${tid} and email is not null;