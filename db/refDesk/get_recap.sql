select * from recap c
join referee r on r.ref_id = c.ref_id
where tid = ${tid}
order by date_time;