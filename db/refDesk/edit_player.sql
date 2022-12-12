update player 
set club = ${club},
    phone = ${phone}
where id = ${id};

select * from player;