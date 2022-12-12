select * from rank_partner
where eid = ${eid} and (pid1 = ${one} or pid1 = ${two} or pid2 = ${one} or pid2 = ${two});