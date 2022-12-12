select 
coalesce((select last || ', ' || first from referee where ref_id = t.ref_id), '') as name,
time, message, sid
from text_log t 
where type = ${category} and tid = ${tid}
order by id;