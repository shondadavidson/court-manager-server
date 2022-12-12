insert into court_assignments (
    tid,
    court_num,
    ref_id,
    ref_cred,
    start_time,
    end_time,
    medal,
    match_type,
    on_court,
    sysid,
    paid,
    amount,
    second_paid, 
    second_amount, 
    
    second_ref, second_cred)
    
    values (${tid}, ${court_num}, ${ref_id}, 
    (select credentials from referee where ref_id = ${ref_id}),
    now(), now(), 'Gold', 'tie-breaker',false, ${sysid}, ${tiePaid}, ${tieAmount}, ${tieSecondPaid}, ${tieSecondAmount}, ${second}, (select credentials from referee where ref_id = ${second}));

   
   
   select text as send_text, test, country, to_char((now() AT TIME ZONE (select time_zone from tournament where tid = ${tid})), 'MM/DD HH12:MI am') as time,
(select COALESCE(NULLIF(phone,''), 'no') as phone from referee where ref_id = ${ref_id}),
(select COALESCE(NULLIF(phone,''), 'no') as second_phone from referee where ref_id = ${second})
from tournament where tid = ${tid};