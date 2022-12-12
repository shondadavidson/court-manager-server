select t.tid, name, COALESCE(NULLIF(location, ''), '' ) as location, COALESCE(usapa, false) as usapa, active, about, description, 
to_char(start AT TIME ZONE 'UTC' AT TIME ZONE t.time_zone, 'MM/DD/YYYY') as start,
to_char(end_date AT TIME ZONE 'UTC' AT TIME ZONE t.time_zone, 'MM/DD/YYYY') as end_date,
 referee_approval_required, COALESCE(NULLIF(organization, ''), '' ) as organization, COALESCE(line_description, '') as line_description, COALESCE(volunteer_description , '') as volunteer_description, COALESCE(lat, 0)::INTEGER as lat, COALESCE(long, 0)::INTEGER as long, pickleball_canada
from tournament t 
left join tournament_auth a 
on a.tid = t.tid 
where  a.ref_id = ${ref_id} and status = 'active' and end_date >= now() 
and private_tournament = false
order by start;