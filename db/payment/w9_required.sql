update payout
    set w9_required = true 
where tid = ${tid} and ref_id = ${ref_id};