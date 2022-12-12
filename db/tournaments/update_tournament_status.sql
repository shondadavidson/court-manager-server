update tournament
set status = ${status}
where tid = ${tid};

select status from tournament
where tid = ${tid};

