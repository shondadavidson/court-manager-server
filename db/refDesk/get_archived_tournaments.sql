select t.tid, url, name, location, num_of_courts, zone, 
to_char(start AT TIME ZONE t.time_zone, 'MM/DD/YYYY') as start,
to_char(end_date AT TIME ZONE t.time_zone, 'MM/DD/YYYY') as end_date,
text, queue, status, test, referee_approval_required,
certified_amount, level_two_amount, level_one_amount, volunteer_amount, admin_type, time_zone, a.payout, end_date as end_sort, a.referee, a.line_judge as line, a.volunteer
from tournament_auth a
left join tournament t
on t.tid = a.tid
where a.ref_id = ${ref_id} and status = 'archive'
order by end_sort;

