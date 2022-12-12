insert into invoice( tid, ref_id, payment_date, total, bonus, bonus_desc, payment_type, payment_memo)
values (${tid}, ${ref_id}, now(), ${total}, ${bonus}, ${bonusDesc}, ${paymentType}, ${paymentMemo})
returning invoice_id;