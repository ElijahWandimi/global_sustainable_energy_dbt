WITH country_elect AS (
    SELECT *
    FROM {{ ref('country_electricity_dim') }}
)

WITH energy_facts AS (
    SELECT *
    FROM {{ ref('stg_energy_facts') }}
)