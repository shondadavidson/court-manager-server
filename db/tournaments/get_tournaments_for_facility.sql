select tid, name, COALESCE(NULLIF(location, ''), '' ) as location, COALESCE(usapa, false) as usapa, active, about, description, 
to_char(start AT TIME ZONE 'UTC' AT TIME ZONE t.time_zone, 'MM/DD/YYYY') as start,
to_char(end_date AT TIME ZONE 'UTC' AT TIME ZONE t.time_zone, 'MM/DD/YYYY') as end_date,
 referee_approval_required, COALESCE(NULLIF(organization, ''), '' ) as organization, COALESCE(line_description, '') as line_description, COALESCE(volunteer_description , '') as volunteer_description, COALESCE(lat, 0)::INTEGER as lat, COALESCE(long, 0)::INTEGER as long, pickleball_canada
from tournament t 
where  status = 'active' and end_date >= now() and facility ilike ${facility}
and private_tournament = false
order by start;