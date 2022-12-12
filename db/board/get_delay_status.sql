select CASE when delay is not null THEN true else false end as delay, delay_message
from tournament where tid = ${tid};