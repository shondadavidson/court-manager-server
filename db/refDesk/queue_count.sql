update tournament
set queue = ${queue}
where tid = ${tid};

select * from tournament
where tid = ${tid};