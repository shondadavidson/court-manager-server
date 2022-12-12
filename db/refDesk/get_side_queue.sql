select s.ref_id, first, last, first || ' '|| last as name, credentials, credentials_verified, dress_code, center_court, status, end_time, quick_break, last_match, note, side_queue, line_court, tag
from referee r
join ref_signup s on s.ref_id = r.ref_id
where s.tid = ${tid} and status = true and on_court = false and side_queue = true
order by end_time NULLS last ;