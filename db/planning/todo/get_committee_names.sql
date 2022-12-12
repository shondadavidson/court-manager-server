select r.ref_id, first, last from tournament_auth t
left join referee r
on r.ref_id = t.ref_id
where tid = ${tid};