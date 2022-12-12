insert into planning_item(tid, category_id, budget_title, todo_title,  contact, contact_phone, contact_email, item_notes, budget, todo, cid, due_date)
values (${tid}, ${category}, ${budgetTitle}, ${todoTitle}, ${contact}, ${contactPhone}, ${contactEmail}, ${itemNotes}, ${budget}, ${todo}, ${todoCategory}, ${dueDate})

returning pid;