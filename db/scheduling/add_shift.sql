insert into shift( tid, name, pre_reg, description,  spots, certified, level_two, level_one, none, wait_spots,    wait_certified, wait_level_one, wait_level_two, wait_none, category, color, start_time, end_time )
values (${tid}, ${name}, ${preReg}, ${description},  ${spots}, ${certified}, ${levelTwo}, ${levelOne}, ${none}, ${waitSpots},    ${waitCertified}, ${waitLevelOne}, ${waitLevelTwo}, ${waitNone}, ${category}, ${color}, ${startTime}, ${endTime} );



-- insert into shift( tid, name, date, start_time, end_time, spots)
-- values (${tid}, ${name}, ${date}, ${start}, ${end}, ${spots});