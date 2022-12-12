select *,
COALESCE((select first || ' '|| last from referee where ref_id = i.ref_id), '') as name
 from payment_item i 
 where tid = ${tid}
order by event, place;