select cid from courts
where tournament_id = ${tid}
order by court_order desc
limit ${courts};