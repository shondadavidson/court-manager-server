update courts
    set monitor_id = ${ref_id}
where tournament_id = ${tid} and court_num = ${court};