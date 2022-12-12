select s.ref_id, last || ', '|| first as name, r.credentials,
COALESCE((select sum(match_time::INTEGER) from court_assignments where tid = s.tid and (ref_id = s.ref_id or second_ref = s.ref_id)), 0) as time,
COALESCE((select count(*) from court_assignments where tid = s.tid and ref_id = s.ref_id), 0) as lead_count,
COALESCE((select count(*) from court_assignments where tid = s.tid and second_ref = s.ref_id and second_amount is not null),0) as second_count,

COALESCE((select count(*) from court_assignments where tid = s.tid and ref_id = s.ref_id), 0) +
COALESCE((select count(*) from court_assignments where tid = s.tid and second_ref = s.ref_id),0) as total_count,

COALESCE((select sum(amount) from court_assignments where tid = s.tid and ref_id = s.ref_id and amount is not null),0) as lead_amount,
COALESCE((select sum(second_amount) from court_assignments where tid = s.tid and second_ref = s.ref_id),0) as second_amount,
    COALESCE((select sum(amount) from court_assignments where tid = s.tid and ref_id = s.ref_id and amount is not null) +
(select sum(second_amount) from court_assignments where tid = s.tid and second_ref = s.ref_id),0) 
as total_amount,
COALESCE((select count(*) from match_starter where tid = s.tid and ref_id = s.ref_id), 0) as ms_count,
COALESCE((select sum(minutes) from match_starter where tid = s.tid and ref_id = s.ref_id), 0) as ms_minutes

from ref_signup s 
left join referee r 
on r.ref_id = s.ref_id 
where tid = ${tid} and first is not null
order by last, first;
