select 
    client_day
from {{ source('airbyte_schema', 'well_values')}}