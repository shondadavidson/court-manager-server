select sum(total)
from invoice
where tid = ${tid};