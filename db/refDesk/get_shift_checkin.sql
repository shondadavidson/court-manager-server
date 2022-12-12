select * from referee r
join ref_signup s on s.ref_id = r.ref_id
where s.tid = ${tid} and shift_checkin is not null
order by shift_checkin;