WITH rows as (
insert into referee (first, last, phone, email, alt_phone)
select ${first}, ${last}, ${phone}, ${email}, ${phone}
where not exists (
select first from referee where email ilike ${email}
)

returning ref_id as id) 

insert into line_signup (ref_id, tid, status, end_time)
    values( (select id from rows), ${tid}, false, now());