select phone 
from notification_contact 
where second_call = true and active = true and tid = ${tid};
