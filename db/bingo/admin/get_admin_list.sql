select * from bingo_items
where tid = ${tid}
order by required, name;