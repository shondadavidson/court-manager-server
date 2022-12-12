SELECT
   c.ref_id, first, last,credentials, 
   (select count(ref_id) from court_assignments where tid = ${tid} and ref_id = c.ref_id) as count,
  (select count(ref_id) from court_assignments where tid = ${tid} and second_ref = c.ref_id) as second
FROM
   court_assignments c
   left join referee r 
   on r.ref_id = c.ref_id
   where tid = ${tid} 
   
GROUP BY
   c.ref_id, first, last
   order by last, first; 