insert into referee_auth_backup (ref_id, first, last, phone, alt_phone, email, credentials)
select ref_id, first, last, phone, alt_phone, email, credentials from referee where ref_id = ${ref_id};

insert into user_auth ( password, email, ref_id)
VALUES (${password}, ${email}, ${ref_id});

update referee
    set 
     first = ${first}, 
     last = ${last}, 
     phone = ${phone}, 
     alt_phone = ${alt_phone}, 
     credentials = ${credentials},
     credentials_verified = ${credentials},
     newsletter = ${newsletter},
     newsletter_time = now()
where ref_id = ${ref_id};

select u.id as user_id, r.first, r.last, r.phone, r.alt_phone, r.email, r.credentials, r.ref_id
from user_auth u
left join referee r on r.ref_id = u.ref_id
where u.email ilike ${email};