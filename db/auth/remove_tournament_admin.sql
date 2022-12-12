delete from tournament_auth
where tid = ${tid} and ref_id = ${ref_id};

select first, last, t.ref_id
from tournament_auth t
left join referee r
on t.ref_id = r.ref_id
where tid = ${tid}
order by last, first;