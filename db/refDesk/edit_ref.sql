update referee
set ref_id = ${ref_id}, 
first = ${first},
last = ${last},
credentials = ${credentials}, 
credentials_verified = ${credentials},
phone = ${phone}, 
email = ${email}
where ref_id = ${ref_id};

update ref_signup
set barcode = ${barcode}
where tid= ${tid} and ref_id = ${ref_id};

select * from referee r
join ref_signup s on s.ref_id = r.ref_id
where s.tid = ${tid}
order by r.last, r.first;