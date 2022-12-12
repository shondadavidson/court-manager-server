insert into rank_partner (eid, rtid, pid1, pid2)
values (${eid},
(select rtid from rank_event where eid = ${eid}),
${one}, ${two}
);