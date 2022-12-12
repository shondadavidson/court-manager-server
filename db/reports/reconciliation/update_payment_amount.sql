update court_assignments
 set amount = ${amount},
 payment_note = ${newNote}
where id = ${id};
