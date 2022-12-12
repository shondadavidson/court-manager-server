update shift
set
    name = ${name}, 
    pre_reg = ${preReg}, 
    start_time = ${start}, 
    end_time = ${end}, 
    description = ${description}, 
    spots = ${spots},
    none = ${spots},
    wait_spots = ${waitSpots}, 
    wait_none = ${waitSpots},
    color = ${color}, 
    vcid = ${vcid}
where sid = ${sid};