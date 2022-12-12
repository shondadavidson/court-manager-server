select cid, category
from category
where tid = ${tid}
order by category;