select to_char(start, 'YYYY/MM/DD') as start_text,
to_char(end_date, 'YYYY/MM/DD') as end_date_text,
* from tournament t
where tid = ${tid};