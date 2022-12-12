update question
set answer = ${answer},
    answer_by = ${ref_id},
    answered = now(),
    url = null
where qid = ${qid};

select email, question
from user_auth a
left join question q
on q.submitted_by = a.ref_id
where qid = ${qid};
