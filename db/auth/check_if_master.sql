select * 
from tournament_auth 
where tid = ${tid} and ref_id = ${editor}
and admin_type = 'master';