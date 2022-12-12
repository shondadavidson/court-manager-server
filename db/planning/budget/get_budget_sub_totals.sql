select tid,

( 
select COALESCE(sum(total),'0.00')
            from (
                select total
                from planning_item i
                where tid= ${tid} and category_id = 1
            ) s
        ) as total_income,
        ( 
select COALESCE(sum(total),'0.00')
            from (
                select total
                from planning_item i
                where tid= ${tid} and category_id = 4
            ) s
        ) as total_sponsor,
        ( 
select COALESCE(sum(total),'0.00')
            from (
                select total
                from planning_item i
                where tid= ${tid} and category_id = 2
            ) s
        ) as total_income_deductions,
        ( 
select COALESCE(sum(total),'0.00')
            from (
                select total
                from planning_item i
                where tid= ${tid} and category_id = 3
            ) s
        ) as total_expenses
from tournament
where tid = ${tid}
