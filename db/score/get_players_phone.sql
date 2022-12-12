select *
from player_list where tid = ${tid} and name is not null
order by name;