update planning_item
set  
    category_id = ${category}, 
    budget_title =${budgetTitle}, 
    todo_title = ${todoTitle},
    quantity = ${quantity}, 
    rate = ${rate}, 
    total = ${total}, 
    contact = ${contact}, 
    contact_phone = ${contactPhone}, 
    contact_email = ${contactEmail}, 
    item_notes = ${itemNotes},
    budget = ${budget},
    todo = ${todo}
where pid = ${pid};