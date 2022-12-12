select id, rtid, eid,
(select last || ', '|| first from rank_player where pid = pid1) as player_one,
(select last || ', '|| first from rank_player where pid = pid2) as player_two

from rank_player p 
where eid = ${eid};