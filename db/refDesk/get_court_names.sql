select court_num, court_order, description, color
from courts
where tournament_id = ${tid}
order by court_order;