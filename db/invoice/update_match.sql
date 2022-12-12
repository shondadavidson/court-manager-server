update court_assignments
set amount = ${amount},
    paid = true,
    invoice = ${invoice}
where id = ${id};
