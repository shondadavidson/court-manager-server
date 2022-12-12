select COALESCE(last || ', '|| first, '') as name, 
(SUBSTRING(phone, 1, 3) ||'-'||SUBSTRING(phone, 4, 3)|| '-' || SUBSTRING(phone, 7, 4)  ) as cell_phone,
(SUBSTRING(alt_phone, 1, 3) ||'-'||SUBSTRING(alt_phone, 4, 3)|| '-' || SUBSTRING(alt_phone, 7, 4)  ) as other_phone, 

alt_phone, email, credentials, address, city, state, zip, 
usap_ambassador, emergency_name, 
(SUBSTRING(emergency_number, 1, 3) ||'-'||SUBSTRING(emergency_number, 4, 3)|| '-' || SUBSTRING(emergency_number, 7, 4)  ) as emergency_number, 
paypal, venmo , zelle,
COALESCE(shirt, '') as shirt, COALESCE(shirt2, '') as shirt2
from volunteer_signup s 
left join referee r 
on r.ref_id = s.ref_id
where tid = ${tid} and s.ref_id is not null
order by last, first;