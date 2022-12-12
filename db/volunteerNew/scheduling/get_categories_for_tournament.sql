select vcid, name, description 
from volunteer_category 
where show = true and tid = ${tid}
order by name;