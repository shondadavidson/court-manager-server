insert into referee
(first, last, email)
  
SELECT ${first}, ${last}, ${email}
WHERE
    NOT EXISTS (
        SELECT email FROM referee WHERE email ilike ${email}
    )

    returning ref_id
    ;
