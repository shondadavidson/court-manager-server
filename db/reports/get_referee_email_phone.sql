select last, first, email, phone from ref_signup  s
left join referee r
on r.ref_id = s.ref_id
where tid = ${tid};