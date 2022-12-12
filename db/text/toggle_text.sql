update tournament
set text =  not text
where tid = ${tid};

select text from tournament 
where tid = ${tid};