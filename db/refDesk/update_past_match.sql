update court_assignments
    set amount = ${amount},
        paid = ${paid},
        medal = ${medal},
        second_paid = ${secondPaid},
        second_amount = ${secondAmount},
        sysid = ${sysid}
where id = ${id};