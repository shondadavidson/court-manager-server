select tid, url, COALESCE(name,'') as name, location, num_of_courts, zone, active,
to_char(start AT TIME ZONE t.time_zone, 'MM/DD/YYYY') as start,
to_char(end_date AT TIME ZONE t.time_zone, 'MM/DD/YYYY') as end,

end_date, 
 text, queue, status, test, referee_approval_required, referee_coordinator_email, certified_amount, level_two_amount, level_one_amount, volunteer_amount, line_cord_text, score_reporting, COALESCE(organization, '') as organization, lat, long, time_zone, invoiced, 
(select count(*) from courts where tournament_id = t.tid) as court_count
from tournament t
order by end_date, name;