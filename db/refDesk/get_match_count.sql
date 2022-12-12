SELECT
   c.ref_id, first, last, ref_cred as credentials, 
   count(*), 
  (select count(*) from court_assignments where tid = ${tid} and second_ref = c.ref_id) as second
FROM
   court_assignments c
   left join referee r 
   on r.ref_id = c.ref_id
   where tid = ${tid}
   
GROUP BY
   c.ref_id, first, last, ref_cred
   order by last, first;