select tid, name,  COALESCE(referee_coordinator_name, '') as to, referee_coordinator_email as email
from tournament where start > now() and status = 'active';