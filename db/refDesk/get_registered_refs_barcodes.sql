select s.ref_id, barcode, COALESCE(NULLIF(last , ''), '' ) as last, COALESCE(NULLIF(first , ''), '' ) as first from ref_signup s
left join referee r
on r.ref_id = s.ref_id
where s.tid = ${tid}
order by last, first;