WITH rows as (
insert into referee (first, last, email, phone, alt_phone, credentials, credentials_verified, newsletter, newsletter_time)
select ${first}, ${last}, ${email}, ${phone}, ${alt_phone}, ${credentials}, ${credentials}, ${newsletter}, now()

returning ref_id) 


insert into user_auth ( password, email, ref_id)
VALUES (${password}, ${email}, (select ref_id from rows));

select u.id as user_id, r.first, r.last, r.phone, r.alt_phone, r.email, r.credentials, r.ref_id
from user_auth u
left join referee r on r.ref_id = u.ref_id
where u.email ilike ${email};

