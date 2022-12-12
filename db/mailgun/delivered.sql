update email
set delivered = now()
where tracking ilike ( '%' || ${id} || '%');