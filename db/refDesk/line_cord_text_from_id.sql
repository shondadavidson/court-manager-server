select line_cord_text,
( 
select *
            from (
                select court_num
                from court_assignments
                where id = ${id}
            ) s
        ) as courtNum
 from tournament
where tid = ${tid};