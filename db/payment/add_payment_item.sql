insert into payment_item (tid, ref_id, event, place, amount)
values ( ${tid}, ${ref_id}, ${event}, ${place}, ${amount})
returning pid;

update payout 
    set paid = false
where ref_id = ${ref_id} and tid = ${tid};

