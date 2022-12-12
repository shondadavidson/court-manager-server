insert into score (tid, court_num, t1p1, t1p2, t2p1, t2p2, match_type, gold, sysid, match_id)
values (
${tid}, ${court}, ${t1p1}, ${t1p2}, ${t2p1}, ${t2p2}, ${matchType}, ${gold}, ${sysid}, ${matchId})

returning sid;