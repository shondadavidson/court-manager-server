insert into volunteer_category_admin (tid, vcid, ref_id)
values (
    (select tid from volunteer_category where vcid = ${vcid}), ${vcid}, ${ref_id}
);