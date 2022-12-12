update court_assignments
 set second_paid = ${status},
 payment_note = ${newNote}
where id = ${id};
