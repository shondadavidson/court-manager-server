select phone 
from notification_contact 
where medical = true and active = true and tid = ${tid};

