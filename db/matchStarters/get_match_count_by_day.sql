SELECT
   c.ref_id, first, last,credentials, 
   (select count(ref_id) from match_starter where tid = ${tid} and ref_id = c.ref_id
   and (start_time AT TIME ZONE 'utc' AT TIME ZONE (select time_zone from tournament where tid = ${tid}) )::date = ${day}
   ) as count,
   (select sum(minutes) from match_starter where tid = ${tid} and ref_id = c.ref_id
   and (start_time AT TIME ZONE 'utc' AT TIME ZONE (select time_zone from tournament where tid = ${tid}) )::date = ${day}
   ) as minutes
FROM
   match_starter c
   left join referee r 
   on r.ref_id = c.ref_id
   where tid = ${tid} 
  and (start_time AT TIME ZONE 'utc' AT TIME ZONE (select time_zone from tournament where tid = ${tid}) )::date = ${day}
   
GROUP BY
   c.ref_id, first, last, credentials 
   order by last, first;