select r.ref_id, first, last, credentials,
address, city, state, zip, paypal, venmo, zelle
from ref_signup s
left join referee r
on r.ref_id = s.ref_id
where tid = ${tid} 
order by r.last, r.first;