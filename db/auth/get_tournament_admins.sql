select first || ' '|| last as name, t.ref_id, admin_type, t.referee, t.volunteer, t.line_judge as line
from tournament_auth t
left join referee r
on t.ref_id = r.ref_id
where tid = ${tid}
order by last, first;