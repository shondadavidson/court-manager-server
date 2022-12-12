update court_assignments
 set posted_second = ${status},
 payment_note = ${newNote}
where id = ${id};