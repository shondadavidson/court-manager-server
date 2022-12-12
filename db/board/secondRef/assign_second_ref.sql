update court_assignments
set second_ref = ${ref_id},
    second_amount = ${amount},
    second_cred = ${credentials},
    second_paid = ${paid}
where id = ${id};

update courts 
set second_ref = ${ref_id}
where current_match = ${id};

update ref_signup 
set on_court = true,
court_num = (select court_num from court_assignments where id = ${id})
where ref_id = ${ref_id} and tid = (select tid from court_assignments where id = ${id});

select phone, test, text, court_num, country
from referee r  
left join court_assignments a 
on r.ref_id = a.second_ref 
left join tournament t 
on a.tid = t.tid
where a.id = ${id};
