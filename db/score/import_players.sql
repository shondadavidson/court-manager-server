insert into player_list(tid, name, phone)
select ${tid}, ${name}, ${phone}
where not exists (
select name from player_list where name = ${name} and tid = ${tid}
)
