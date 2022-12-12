insert into volunteer_category (tid, name, description, court_monitor, show)

    SELECT ${tid}, ${name}, ${description}, ${courtMonitor}, ${show}
WHERE
    NOT EXISTS (
        SELECT tid FROM volunteer_category WHERE tid = ${tid} and name ilike ${name}
    );