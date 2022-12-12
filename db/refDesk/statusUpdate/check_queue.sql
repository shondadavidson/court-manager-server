select queue::int,
(select count(*) from ref_signup where status = true and on_court = false and tid = ${tid})::int
from tournament 
where tid = ${tid};