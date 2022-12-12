select id from follow f 
left join homepage h 
on f.homepage_id = h.ref_id
where h.url ilike ${url} 
and f.ref_id = ${ref_id};