insert into shift( tid, name, pre_reg, start_time, end_time, description,  spots, none,wait_spots, wait_none, category, color, vcid )
values (${tid}, ${name}, ${preReg}, ${start}, ${end}, ${description},  ${spots}, ${spots}, 
${waitSpots},${waitSpots}, 'other', ${color}, ${vcid} );