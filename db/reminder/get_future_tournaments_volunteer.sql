select tid, name,  COALESCE(volunteer_coordinator_name, '') as to, volunteer_coordinator_email as email
from tournament where start > now() and status = 'active';