select pid, coalesce(name, '') as name
from player_list where tid = ${tid} and name is not null
order by name;