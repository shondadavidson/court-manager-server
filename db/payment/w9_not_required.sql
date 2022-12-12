update payout
    set w9_required = false 
where tid = ${tid} and ref_id = ${ref_id};