update shift
set name = ${name}, 
    pre_reg = ${preReg},
    description = ${description},
    spots = ${spots},
    certified = ${certified}, 
    level_two = ${levelTwo}, 
    level_one = ${levelOne}, 
    none = ${none},
    wait_spots = ${waitSpots},    
    wait_certified = ${waitCertified}, 
    wait_level_one = ${waitLevelOne}, 
    wait_level_two = ${waitLevelTwo}, 
    wait_none = ${waitNone},
    category = ${category},
    color = ${color},
    start_time = ${start},
    end_time = ${end}
where sid = ${sid};

