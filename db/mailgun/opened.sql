update email
set viewed = now()
where tracking ilike ( '%' || ${id} || '%');