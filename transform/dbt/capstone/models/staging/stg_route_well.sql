select
    stop_id,
    route_name,
    stop_name,--,
    api_num, --wait on this issues with lead zeroand 0000
    case
        when route_name in ('UT-EAST-01',
                    'UT-MIDDLE-01',
                    'UT-WEST-01') then 'Riverbend'
        when route_name in ('UT-EAST-02') then 'Natural Buttes'
        when route_name in (  'WY-NORTH-01',
                    'WY-SOUTH-01') then 'Wyoming'
        when route_name in ( 'UT-FLAT IRON MESA',
                    'UT-PETERS POINT EAST',
                    'UT-PETERS POINT WEST',
                    'UT-PRICKLY PEAR EAST',
                    'UT-PRICKLY PEAR WEST') then 'West Tavaputs'
    else 'Raton' end as area
    --lt.client_day AS last_day,
    --well.client_day::DATE
from {{ source('airbyte_schema', 'well_values')}} well
inner join {{ ref('stg_last_date')}} lt
    on well.client_day::DATE = lt.client_day
where 
    route_name IN ('UT-EAST-01',
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
    api_num IS NOT NULL

