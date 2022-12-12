select COALESCE(description, '') as description from courts
where tournament_id = ${tid} and court_num = ${court_num}; 