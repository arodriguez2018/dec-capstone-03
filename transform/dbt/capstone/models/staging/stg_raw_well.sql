select
    stop_id,
    client_day::DATE as client_day,
    round(oil_produced::NUMERIC,0) as oil_production,
    ROUND(gas_production::NUMERIC,0) as gas_production,
    ROUND(casing_pressure::numeric,0) as casing_pressure,
    ROUND(tubing_pressure::numeric,0) as tubing_pressure,
    ROUND(water_production::numeric,0) as water_production
from {{ source('airbyte_schema', 'well_values')}}
where
    route_name IN (
                    'UT-EAST-01',
                    'UT-EAST-02',
                    'UT-MIDDLE-01',
                    'UT-WEST-01',
                    'WY-NORTH-01',
                    'WY-SOUTH-01',
                    'UT-FLAT IRON MESA',
                    'UT-PETERS POINT EAST',
                    'UT-PETERS POINT WEST',
                    'UT-PRICKLY PEAR EAST',
                    'UT-PRICKLY PEAR WEST',
                    'NM - ROUTE 1',
                    'NM - ROUTE 10',
                    'NM - ROUTE 3',
                    'NM - ROUTE 4',
                    'NM - ROUTE 5',
                    'NM - ROUTE 6',
                    'NM - ROUTE 7',
                    'NM - ROUTE 9'
                    ) and 
    client_day::DATE > '2021-11-01' AND
    stop_name not in ('North Alger 01-34 SWD', 'RBU 01-10D Injection Well')