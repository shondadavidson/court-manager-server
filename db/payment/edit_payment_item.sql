update payment_item
set tid =  ${tid}, 
    ref_id = ${ref_id},
    event = ${event}, 
    place = ${place}, 
    amount = ${amount}
where pid = ${pid} and paid = false;

update payout 
    set paid = false
where ref_id = ${ref_id} and tid = ${tid};
