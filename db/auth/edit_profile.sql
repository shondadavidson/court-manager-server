update referee 
set newsletter = ${newsletter},
    newsletter_time = now()
where newsletter != ${newsletter};

update referee
set first = ${first},
last = ${last},
credentials = ${credentials},
credentials_verified = ${credentials},
phone = ${phone},
alt_phone = ${alt_phone},
address = ${address},
city = ${city},
state = ${state},
zip= ${zip},
shirt = ${shirt},
shirt2=${shirt2},
usap_ambassador = ${ambassador}, 
emergency_name = ${emergencyName}, 
emergency_number = ${emergencyNumber},
referee = ${contactForReferee},
line_judge = ${contactForLine},
volunteer = ${contactForVolunteer},
paypal = ${paypal},
venmo = ${venmo},
zelle = ${zelle}
where ref_id = ${ref_id};

update user_auth
set
profile_updated = true
where ref_id = ${ref_id};

select ref_id, first, last, credentials, phone, email, alt_phone from referee
where ref_id = ${ref_id};