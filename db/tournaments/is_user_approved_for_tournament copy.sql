select ref_id, referee_approved as approved, referee_request as requested
from volunteer_auth
where ref_id = ${ref_id} and tid = ${tid}