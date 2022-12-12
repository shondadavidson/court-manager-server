select shift_id 
from shift_spots 
where tid = ${tid} and ref_id = ${ref_id} and referee = true;