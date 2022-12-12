update ref_signup
set side_queue = not side_queue,
    end_time = now()
where tid = ${tid} and ref_id = ${ref_id};

select s.ref_id, first, last, credentials, credentials_verified, dress_code, center_court, status, end_time, quick_break, last_match, note, side_queue, line_court
    from referee r
join ref_signup s on s.ref_id = r.ref_id
where s.tid = ${tid} and status = true and on_court = false and s.ref_id = ${ref_id};