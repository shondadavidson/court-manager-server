SELECT
   count(id) as total 
   from match_starter
   where tid = ${tid};
   