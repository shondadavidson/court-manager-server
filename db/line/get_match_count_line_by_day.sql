SELECT
   c.ref_id, first, last,
   COUNT (c.ref_id)
FROM
   line_assignments c
   left join referee r 
   on r.ref_id = c.ref_id
   where tid = ${tid} and start_time::date = ${day}
   
GROUP BY
   c.ref_id, first, last
   order by last, first; 