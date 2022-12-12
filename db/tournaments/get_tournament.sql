select tid, status, url, name, location, active, description, to_char(start AT TIME ZONE t.time_zone, 'MM/DD/YYYY') as start,
to_char(end_date AT TIME ZONE t.time_zone, 'MM/DD/YYYY') as end_date, procedures, queue, 
referee_approval_required, referee_coordinator_email, organization, line_description, volunteer_description, 
	referee_coordinator_name, line_coordinator_name, volunteer_coordinator_name, score_reporting, time_zone, 
	referee, line, volunteer, qr_guide, volunteer_signature_required, volunteer_waiver,
(
select * from
            (
                select start::date >= (current_date - INTEGER '1')::date
                from tournament
                where tid = ${tid}
            ) s
        ) as tournament_started,
        (
select exists
            (
                select *
                from ref_signup
                where tid = ${tid} and ref_id = ${ref_id}
                limit 1
            ) s
        ) as referee,
        (
select exists
            (
                select *
                from line_signup
                where tid = ${tid} and ref_id = ${ref_id}
                limit 1
            ) s
        ) as line,(
select exists
            (
                select *
                from volunteer_signup
                where tid = ${tid} and ref_id = ${ref_id}
                limit 1
            ) s
        ) as volunteer
        
from tournament t
where tid = ${tid};