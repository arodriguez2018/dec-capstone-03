select 
    client_day::DATE as DATE,
    GAS_PRODUCTION::NUMERIC as GAS_PROD,
    route_name,
    stop_name
from {{ source('airbyte_schema', 'well_values')}}
where 
    route_name like ('UT%') and 
    client_day::DATE > '2022-01-01'