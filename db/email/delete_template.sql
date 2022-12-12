delete from email_templates
where etid = ${etid};

select * from email_templates
where ref_id = ${ref_id}
order by name;