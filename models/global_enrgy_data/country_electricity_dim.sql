with electricity_dim as (
    select  electricity_data_id,
            Electricity_from_fossil_fuels,
            Electricity_from_nuclear,
            Electricity_from_renewables,
            `Low-carbon_electricity_perct` AS Low_carbon_electricity_perct,
            Access_to_electricity_perct,
    from `sonorous-asset-391616.global_sustainable_energy_data.electricity_dim`
),
country_dim AS (
    SELECT *
    FROM `sonorous-asset-391616.global_sustainable_energy_data.country_dim`
),
final AS (
    SELECT  c.country_id,
            e.Electricity_from_fossil_fuels,
            e.Electricity_from_nuclear,
            e.Electricity_from_renewables,
            COALESCE(e.Low_carbon_electricity_perct,0) AS Low_carbon_electricity_perct,
            e.Access_to_electricity_perct,
            c.Entity,
            c.Land_Area,
    FROM electricity_dim e
    INNER JOIN country_dim c
    ON e.electricity_data_id = c.country_id
    WHERE electricity_data_id IS NOT NULL
)

SELECT * FROM final