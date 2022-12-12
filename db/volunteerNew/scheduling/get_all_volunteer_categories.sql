select c.vcid, c.name, c.description, c.show
 from volunteer_category c 
where c.tid = ${tid}
order by c.name;