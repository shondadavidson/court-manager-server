SELECT
   count(id) as total 
   from match_starter
   where tid = ${tid}
   and (start_time AT TIME ZONE 'utc' AT TIME ZONE (select time_zone from tournament where tid = ${tid}) )::date = ${day};
   