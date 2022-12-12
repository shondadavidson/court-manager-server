select invoice_id, tid, i.ref_id, payment_date, total, bonus, bonus_desc, payment_type, first, last
from invoice i
left join referee r
on r.ref_id = i.ref_id
where tid = ${tid}
order by payment_date desc;