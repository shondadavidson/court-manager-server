select regexp_replace(phone, '[^0-9]+', '', 'g') as phone
from player_list
where pid = ${id}