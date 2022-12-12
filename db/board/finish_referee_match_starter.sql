update ref_signup
    set note = ''
where tid = ${tid} and ref_id = ${ref_id};

update match_starter
    set end_time = now(),
        minutes = abs(extract(epoch from now() - start_time) / 60 )::integer
where tid = ${tid} and ref_id = ${ref_id} and end_time is null;

update courts 
set match_starter_id = null,
    match_starter_name = null
where match_starter_id = ${ref_id} and tournament_id = ${tid};
