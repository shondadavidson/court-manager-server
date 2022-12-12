update payout
set
    total = ${sum},
    paid = false
where ref_id = ${ref_id} and tid = ${tid};