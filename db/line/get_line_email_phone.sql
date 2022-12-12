select r.ref_id, first, last, email, alt_phone, phone, credentials from line_signup l
left join referee r
on r.ref_id = l.ref_id
where tid = ${tid}
order by last, first;