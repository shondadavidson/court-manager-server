select phone,
( 
select *
            from (
                select text
                from tournament
                where tid = ${tid}
            ) s
        ) as text
 from shift_spots s
left join referee r
on r.ref_id = s.ref_id
where s.sid = ${sid};