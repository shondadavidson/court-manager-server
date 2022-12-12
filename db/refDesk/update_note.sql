update ref_signup
set note = ${note},
    tag = ${tag}
where tid = ${tid} and ref_id = ${ref_id};