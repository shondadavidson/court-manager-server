select *, 
(select *
                from (
                    select name
                    from player_list p 
                    where s.t1p1 = p.pid
                ) s
            ) as t1p1_name,
            (select *
                from (
                    select name
                    from player_list p 
                    where s.t1p2 = p.pid
                ) s
            ) as t1p2_name,
            (select *
                from (
                    select name
                    from player_list p 
                    where s.t2p1 = p.pid
                ) s
            ) as t2p1_name,
            (select *
                from (
                    select name
                    from player_list p 
                    where s.t2p2 = p.pid
                ) s
            ) as t2p2_name
from score s
where tid = ${tid}
order by submitted desc;

