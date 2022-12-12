select c.vcid, c.name, c.description, c.show
 from volunteer_category_admin a 
left join volunteer_category c 
on a.vcid = c.vcid
where a.tid = ${tid} and a.ref_id = ${ref_id}
order by c.name;