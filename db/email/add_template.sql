insert into email_templates (ref_id, name, subject, body, type)
values (${ref_id}, ${name}, ${subject}, ${body}, ${type});

select * from email_templates
where ref_id = ${ref_id};