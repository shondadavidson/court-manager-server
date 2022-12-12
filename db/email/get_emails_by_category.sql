select 
coalesce((select last || ', ' || first from referee where ref_id = e.ref_id), '') as name,
(select last || ', ' || first from referee where ref_id = e.author) as author,
time, subject, body, delivered, viewed
from email e 
where category = ${category} and tid = ${tid} and ref_id > 0
order by eid;