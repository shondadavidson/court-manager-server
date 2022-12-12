insert into match_starter (tid, ref_id)
values (${tid}, ${ref_id});

update ref_signup
    set note = 'Starting Match'
where tid = ${tid} and ref_id = ${ref_id};

update courts 
set match_starter_id = ${ref_id},
    match_starter_name = ${name}
where court_num = ${court} and tournament_id = ${tid};

select country, phone, text, to_char((now() AT TIME ZONE (select time_zone from tournament where tid = ${tid})), 'MM/DD HH12:MI am') as time
from ref_signup s 
left join referee r 
on r.ref_id = s.ref_id 
left join tournament t 
on t.tid = s.tid 
where s.tid = ${tid} and s.ref_id = ${ref_id}; 