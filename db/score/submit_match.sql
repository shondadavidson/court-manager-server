update score
    set t1_g1_score = ${score1T1},
    t2_g1_score = ${score1T2},
    t1_g2_score = ${score2T1},
    t2_g2_score = ${score2T2},
    t1_g3_score = ${score3T1},
    t2_g3_score = ${score3T2},
    t1_g4_score = ${score4T1},
    t2_g4_score = ${score4T2},
    t1_winner = ${winner},
    signature = ${signature},
    submitted = now()
    where sid = ${sid};