update court_assignments
 set paid = true,
 payment_note = payment_note || ' '|| ${first}|| ' paid'
where tid = ${tid} and ref_id = ${ref_id} and payment_note is not null;

update court_assignments
 set paid = true,
 payment_note = ${first}|| ' paid'
where tid = ${tid} and ref_id = ${ref_id} and payment_note is null;

update court_assignments
 set second_paid = true,
 payment_note = payment_note || ' '|| ${first}|| ' paid supporting'
where tid = ${tid} and second_ref = ${ref_id} and payment_note is not null;

update court_assignments
 set second_paid = true,
 payment_note = ${first}|| ' paid supporting'
where tid = ${tid} and second_ref = ${ref_id} and payment_note is null;

