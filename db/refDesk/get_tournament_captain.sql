select distinct(t.tid), url, name, location, zone, 
to_char(start AT TIME ZONE 'UTC' AT TIME ZONE t.time_zone, 'MM/DD/YYYY') as start,
to_char(end_date AT TIME ZONE 'UTC' AT TIME ZONE t.time_zone, 'MM/DD/YYYY') as end_date,
time_zone,
(CASE WHEN vcid > 0  THEN true end) as volunteer_captain
from volunteer_category_admin a
left join tournament t
on t.tid = a.tid
where a.ref_id = ${ref_id} and (status = 'active' or status = 'draft')
order by end_date; 