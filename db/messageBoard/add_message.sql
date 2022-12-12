insert into message_board (tid, ref_id, category, message, post_time)
values (${tid}, ${ref_id}, ${category}, ${message}, now());