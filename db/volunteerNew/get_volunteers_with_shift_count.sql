select vs.tid, r.ref_id, last || ', ' ||first as name, 
(select count(*) from shift_spots where ref_id = vs.ref_id and tid = ${tid}) as count


from volunteer_signup vs 
left join referee r 
on vs.ref_id = r.ref_id
where vs.tid = ${tid} and r.ref_id is not null
order by r.last, r.first