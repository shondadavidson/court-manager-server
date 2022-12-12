update  ref_signup
set dress_code =  not dress_code
where ref_id = ${ref_id} and tid = ${tid};

insert into recap (tid, ref_id, status, date_time)
values (${tid}, ${ref_id}, 'Dress Code On/Off', now());