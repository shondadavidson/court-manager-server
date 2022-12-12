update match_starter 
    set tid = ${ptid},
        past_tid = ${tid}
    where tid = ${tid};

update court_assignments
    set tid = ${ptid},
        past_tid = ${tid}
    where tid = ${tid};
  