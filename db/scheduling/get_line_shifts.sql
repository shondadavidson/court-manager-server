select * from shift
where tid = ${tid} and category = 'Line Judge'
order by category desc, date, start_time, name;