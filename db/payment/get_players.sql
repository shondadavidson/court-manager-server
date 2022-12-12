select id, tid, p.ref_id, COALESCE(w9_required, false) as w9_required, COALESCE(w9_received, false) as w9_received, cast(total as money) as total, paid, note, first || ' '|| last as name,
(SUBSTRING(phone, 1, 3) ||'-'||SUBSTRING(phone, 4, 3)|| '-' || SUBSTRING(phone, 7, 4)  ) as cell_phone,
(SUBSTRING(alt_phone, 1, 3) ||'-'||SUBSTRING(alt_phone, 4, 3)|| '-' || SUBSTRING(alt_phone, 7, 4)  ) as other_phone, 

alt_phone, email, credentials, address, city, state, zip, paypal, venmo, zelle,
(
    select coalesce(json_agg(s), '[]'::json)
                from (  
                    select pid, event, place, cast(amount as money) as amount, i.paid, i.payment_type, i.payment_date, i.paid_by
                    from payment_item i
                    where tid = p.tid and ref_id = p.ref_id
                    order by event
                ) s
            ) as items
from payout p 
left join referee r 
on r.ref_id = p.ref_id
where p.tid = ${tid}
order by name;