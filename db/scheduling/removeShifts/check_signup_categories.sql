select t.name as tournament, t.test, line_coordinator_email, volunteer_coordinator_email, referee_coordinator_email,
(select count(*) from ref_signup where ref_id = ${ref_id} and tid = ${tid}) ref_signup,
(select count(*) from line_signup where ref_id = ${ref_id} and tid = ${tid}) line_signup,
(select count(*) from volunteer_signup where ref_id = ${ref_id} and tid = ${tid}) volunteer_signup

from tournament t where tid = ${tid};