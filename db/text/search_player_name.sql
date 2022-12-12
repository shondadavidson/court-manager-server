select *
from player  
where name ilike ('%' || $1 || '%');