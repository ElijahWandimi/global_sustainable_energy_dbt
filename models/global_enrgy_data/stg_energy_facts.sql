WITH tbl_view_facts AS (
    SELECT *
    FROM sonorous-asset-391616.global_sustainable_energy_data.facts_table
    ),
    view_enrgy_facts AS (
        SELECT  energy_data_id,
                Primary_energy_consumption_per_capita_kWhperson,
                Energy_intensity_level_of_primary_energy, 
                `Renewable-electricity-generating-capacity-per-capita` AS Renewable_electricity_generating_capacity_percapita,
                Renewable_energy_share_in_total_final_energy_consumption_perct,
                Renewables_perct_primary_energy,
        FROM sonorous-asset-391616.global_sustainable_energy_data.energy_dim
    ),

    energy_facts AS (
        SELECT  f.facts_id AS country_id,
                f.gdp_growth,
                f.gdp_per_capita, 
                f.Density_pkm,
                f.Year, 
                f.Financial_flows_to_developing_countries, 
                f.Value_co2_emissions_kt_by_country,
                f.Access_to_clean_fuels_for_cooking,
                e.Primary_energy_consumption_per_capita_kWhperson,
                e.Energy_intensity_level_of_primary_energy, 
                COALESCE(e.Renewable_electricity_generating_capacity_percapita, 0) AS Renewable_electricity_generating_capacity_percapita,
                COALESCE(e.Renewable_energy_share_in_total_final_energy_consumption_perct, 0) AS Renewable_energy_share_in_total_final_energy_consumption_perct,
                e.Renewables_perct_primary_energy
        FROM tbl_view_facts f
        INNER JOIN view_enrgy_facts e
        ON f.facts_id = e.energy_data_id
        WHERE f.facts_id IS NOT NULL
    )

SELECT * FROM energy_facts
