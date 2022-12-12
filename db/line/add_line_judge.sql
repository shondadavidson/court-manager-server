with rows as (
insert into referee (first, last, credentials, credentials_verified, phone, alt_phone, email)
select ${first}, ${last}, ${credentials}, ${credentials_verified}, ${phone}, ${phone}, ${email}
where not exists (
select first from referee where first = ${first} and last = ${last} and phone = ${phone}
)
returning ref_id)

insert into line_signup (tid, ref_id)
values (${tid}, (select ref_id from rows))
returning ref_id;

