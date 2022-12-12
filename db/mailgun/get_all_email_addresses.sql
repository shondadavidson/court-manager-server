select email, first || ' '|| last as name 
from referee where email is not null;