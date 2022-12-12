update court_assignments
 set paid = ${status},
 payment_note = ${newNote}
where id = ${id};
