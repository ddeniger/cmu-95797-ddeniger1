select 
    {{ dbt_utils.star(ref('events')) }}
from {{ ref('events') }}
QUALIFY row_number() OVER
    (partition by event_id
     order by insert_timestamp desc)
     =1;

