insert into rank_event (rtid, type)
select ${rtid}, ${type}
where not exists (
select type from rank_event where rtid = ${rtid} and type = ${type}
);