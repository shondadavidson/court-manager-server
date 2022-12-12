select phone, s.ref_id,
( 
select *
            from (
                select text
                from tournament
                where tid = ${tid}
            ) s
        ) as text
 from line_signup s  
left join referee r
on r.ref_id = s.ref_id
where s.gid = ${gid};



