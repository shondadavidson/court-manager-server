select invoice_id, i.tid, i.ref_id, payment_date, total, bonus, bonus_desc, payment_type, payment_memo, first, last, name,
(
    select coalesce(json_agg(s), '[]'::json)
                from (  
                    select id, court_num, start_time, end_time, match_time, amount
                    from court_assignments
                    where invoice = ${invoice} 
                ) s
            ) as detail
from invoice i
left join referee r
on r.ref_id = i.ref_id
left join tournament t
on t.tid = i.tid
where invoice_id = ${invoice}
order by payment_date;