update tournament 
    set name = ${name}, 
    location = ${location}, 
    num_of_courts = ${num_of_courts}, 
    zone = ${zone}, 
    usapa = ${usapa},
    start = ${start},
    end_date = ${end}, 
    about = ${about}, 
    description = ${description},
    referee_approval_required = ${referee_approval_required}, 
    referee_coordinator_email = ${referee_coordinator_email},
    referee_coordinator_number = ${referee_coordinator_number},
    head_referee = ${head_referee}, 
    head_referee_phone = ${head_referee_phone},
    certified_amount = ${certified},
    level_two_amount = ${level2},
    level_one_amount = ${level1},
    volunteer_amount = ${notRated},
    line_cord_text = ${line_cord_text},
    line_description = ${line_description}, 
    volunteer_description = ${volunteer_description},
    referee_coordinator_name = ${referee_coordinator_name}, 
    line_coordinator_name = ${line_coordinator_name}, 
    line_coordinator_email = ${line_coordinator_email}, 
    volunteer_coordinator_name = ${volunteer_coordinator_name}, 
    volunteer_coordinator_email = ${volunteer_coordinator_email},
    volunteer_waiver = ${volunteer_waiver}, 
    volunteer_signature_required = ${volunteer_signature_required},
    medical_number = ${medical_number},
    referee_post_pay = ${postPaid},
    zero_payout_warning = ${zeroWarning},
    private_tournament = ${private_tournament},
    facility_map = ${facility_map},
    pickleball_canada = ${pickleballCanada}
where tid = ${tid};
