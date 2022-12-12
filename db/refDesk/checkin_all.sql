select ref_id from ref_signup where tid =${tid} and shift_checkin is not null 
order by shift_checkin;