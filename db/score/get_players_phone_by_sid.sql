select sid , 
(select phone from referee where ref_id = t1p1 and phone is not null) as p1,
(select phone from referee where ref_id = t1p2 and phone is not null) as p2,
(select phone from referee where ref_id = t2p2 and phone is not null) as p3,
(select phone from referee where ref_id = t2p2 and phone is not null) as p4
from score where sid = ${sid};