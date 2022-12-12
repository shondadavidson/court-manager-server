SELECT
   c.ref_id, first, last,
   COUNT (c.ref_id)
FROM
   line_assignments c
   left join referee r 
   on r.ref_id = c.ref_id
   where tid = ${tid}
   
   
GROUP BY
   c.ref_id, last, first
   order by last, first; 
