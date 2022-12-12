update court_assignments
 set second_amount = ${amount},
 payment_note = ${newNote}
where id = ${id};
