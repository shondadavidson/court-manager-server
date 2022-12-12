select t.parent_tournament, p.name 
from tournament t 
left join tournament p 
on p.tid = t.parent_tournament
where t.tid = ${tid};