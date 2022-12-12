WITH rows as (
insert into referee (first, last, credentials, credentials_verified, phone, email)
values( ${first}, ${last}, ${credentials}, ${credentials_verified}, ${phone}, ${email})

returning ref_id as id) 

insert into ref_signup (ref_id, tid, barcode, status, end_time)
    values( (select id from rows), ${tid}, ${barcode}, true, now());

select * from referee r
join ref_signup s on s.ref_id = r.ref_id
where s.tid = ${tid}
order by r.last, r.first;