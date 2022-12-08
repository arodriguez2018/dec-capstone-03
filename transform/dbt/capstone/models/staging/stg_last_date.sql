select
    client_day
from {{ source('airbyte_schema', 'well_values')}}
order by client_day DESC
limit 1