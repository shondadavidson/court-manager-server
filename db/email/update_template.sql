update email_templates
set name = ${name},
subject = ${subject},
body = ${body},
type = ${type}
where etid = ${id};

select * from email_templates
where ref_id = ${ref_id};