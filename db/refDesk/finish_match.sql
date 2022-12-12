update ref_signup
    set on_court = false,
    court_num = null,
    end_time = now(),
    note = null,
    side_queue = false
    where court_num = ${court_num} and tid = ${tid};

update court_assignments 
    set 
    end_time = now(), 
    on_court = false,
    clipboard = false,
    sysid = ${sysid},
    medal = ${medal},
    amount = ${amount},
    paid = ${paid}
    where id = ${id};

update courts 
    set ref_id = null,
    start_time = null,
    current_match = null,
    line_group = null,
    medal = null,
    second_ref = null
where court_num = ${court_num} and tournament_id = ${tid};


update court_assignments 
    set 
    match_time  =   (SELECT (DATE_PART('day', (select end_time) - (select start_time)) * 24 + 
              DATE_PART('hour', (select end_time) - (select start_time) )) * 60 +
              DATE_PART('minute', (select end_time) - (select start_time)) )
    where id = ${id};

select c.court_num, c.ref_id, COALESCE(c.start_time::TEXT,'0') as start_time, c.current_match, r.first, r.last, r.phone, r.email, r.credentials, r.credentials_verified
from courts c 
    left join referee r
    on c.ref_id = r.ref_id
where tournament_id = ${tid}
order by c.court_num;