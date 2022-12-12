select ref_id, first, last, email, credentials, COALESCE(NULLIF(phone, ''), '' ) as phone, COALESCE(NULLIF(alt_phone, ''), '' ) as alt_phone, shirt, shirt2, 
address, city, state, zip, usap_ambassador, emergency_name, emergency_number, referee, line_judge, volunteer, paypal, venmo, zelle, newsletter
from referee
where ref_id = ${ref_id};