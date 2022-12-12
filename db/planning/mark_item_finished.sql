update planning_item
set completed = not completed
where pid = ${pid};