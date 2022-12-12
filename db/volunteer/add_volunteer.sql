
insert into referee (first, last, credentials, credentials_verified, phone, alt_phone, email)
select ${first}, ${last}, ${credentials}, ${credentials_verified}, ${phone}, ${phone}, ${email}
where not exists (
select email from referee where email ilike ${email}
);

select ref_id from referee where email iLike ${email};