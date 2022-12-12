update court_assignments
 set posted = ${status},
 payment_note = ${newNote}
where id = ${id};

