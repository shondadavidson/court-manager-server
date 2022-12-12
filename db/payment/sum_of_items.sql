select COALESCE(sum(amount), 0) as sum 
from payment_item
where ref_id = ${ref_id} and tid = ${tid} and amount is not null;