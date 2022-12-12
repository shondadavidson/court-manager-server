insert into notifications(tid, ref_id, type, court_num,  time)
values (${tid}, ${ref_id}, 'td', (select court_num from courts where tournament_id = ${tid} and ref_id = ${ref_id}), now());

select court_num, referee_coordinator_number, r.first, r.last, r.phone, t.test, country
from courts c
left join tournament t
on c.tournament_id = t.tid
left join referee r
on r.ref_id = c.ref_id
where tournament_id = ${tid} and c.ref_id = ${ref_id};