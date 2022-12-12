update payment_item
    set paid = true,
        payment_type = ${type},
        payment_date = now(),
        paid_by = ${name}
where ref_id = ${ref_id} and tid = ${tid} and paid = false;

update payout 
    set paid = true
where ref_id = ${ref_id} and tid = ${tid};
