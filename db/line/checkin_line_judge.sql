update line_signup
set status = true,
end_time = now()
where ref_id = ${ref_id} and tid = ${tid};