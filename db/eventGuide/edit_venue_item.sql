update venue_item
    set title = ${title}, 
        details = ${details}, 
        link = ${link}, 
        image = ${image}, 
        color = ${color}, 
        list_order = ${order}, 
        show = ${show}
    where id = ${id};