select * from email_templates
where ref_id = ${ref_id} and type = 'text'
order by name;