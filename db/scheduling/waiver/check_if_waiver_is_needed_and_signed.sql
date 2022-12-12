select signed from tournament t 
left join volunteer_signup v 
on t.tid = v.tid
where t.tid = ${tid} and v.ref_id = ${ref_id};