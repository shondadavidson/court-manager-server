select ARRAY(select name from bingo_items 
where tid = ${tid}
order by required desc, random() limit 24);