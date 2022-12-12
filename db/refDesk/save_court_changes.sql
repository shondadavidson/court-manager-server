update court_assignments
set sysid = ${sysid},
    medal= ${medal},
    amount = ${amount},
    paid = ${paid}
where id = ${id};

update courts
set medal = ${medal}
where current_match = ${id};