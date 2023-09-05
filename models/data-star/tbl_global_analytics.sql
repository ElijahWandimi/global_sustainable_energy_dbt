WITH country_elect AS (
    SELECT *
    FROM {{ ref('country_electricity_dim') }}
),
 energy_facts AS (
    SELECT *
    FROM {{ ref('stg_energy_facts') }}
),
final_model AS (
    SELECT  e.country_id,
            e.gdp_growth,
            e.gdp_per_capita, 
            e.Density_pkm,
            e.Year, 
            e.Financial_flows_to_developing_countries, 
            e.Value_co2_emissions_kt_by_country,
            e.Access_to_clean_fuels_for_cooking,
            e.Primary_energy_consumption_per_capita_kWhperson,
            e.Energy_intensity_level_of_primary_energy, 
            e.Renewable_electricity_generating_capacity_percapita,
            e.Renewable_energy_share_in_total_final_energy_consumption_perct,
            e.Renewables_perct_primary_energy,
            c.Electricity_from_fossil_fuels,
            c.Electricity_from_nuclear,
            c.Electricity_from_renewables,
            c.Low_carbon_electricity_perct,
            c.Access_to_electricity_perct,
            c.Entity,
            c.Land_Area
    FROM energy_facts e
    JOIN country_elect c 
    USING country_id

)

SELECT * FROM final_model