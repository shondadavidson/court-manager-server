select distinct(t.tid), url, name, location, num_of_courts, zone, 
to_char(start AT TIME ZONE t.time_zone, 'MM/DD/YYYY') as start,
to_char(end_date AT TIME ZONE t.time_zone, 'MM/DD/YYYY') as end_date,
 text, queue, status, test, referee_approval_required, referee_post_pay,
certified_amount, level_two_amount, level_one_amount, volunteer_amount, score_reporting, time_zone,
a.admin_type,
a.referee, a.line_judge as line, a.volunteer, a.payout, zero_payout_warning,
end_date as end_date_sort
from tournament_auth a
left join tournament t
on t.tid = a.tid

where a.ref_id = ${ref_id} and (status = 'active' or status = 'draft')
order by end_date_sort; 