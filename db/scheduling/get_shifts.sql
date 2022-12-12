select * from shift
where tid = ${tid}
order by category desc, date, start_time, name;