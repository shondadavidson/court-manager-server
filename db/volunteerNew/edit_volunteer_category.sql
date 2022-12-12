update volunteer_category
set 
    name = ${name},
    description = ${description},
    court_monitor = ${courtMonitor},
    show = ${show}
where vcid = ${vcid};