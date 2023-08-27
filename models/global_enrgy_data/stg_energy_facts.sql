with tbl_view_facts as (
    select *
    from sonorous-asset-391616.global_sustainable_energy_data.facts_table
    ),
    view_enrgy_facts as (
        select *
        from sonorous-asset-391616.global_sustainable_energy_data.energy_dim
    ),

    energy_facts as (
        select  f.facts_id as energy_country_id,
                f.gdp_growth,
                f.gdp_per_capita, 
                f.Density_pkm,
                f.Year, 
                f.Financial_flows_to_developing_countries, 
                f.Value_co2_emissions_kt_by_country,
                f.Access_to_clean_fuels_for_cooking,
                e.Primary_energy_consumption_per_capita_kWhperson,
                e.Energy_intensity_level_of_primary_energy, 
                e.Renewable-electricity-generating-capacity-per-capita,
                e.Renewable_energy_share_in_total_final_energy_consumption_perct,
                e.Renewables_perct_primary_energy
        from tbl_view_facts f
        where f.facts_id is not null
        inner join view_enrgy_facts e
        on f.facts_id = e.enrgy_data_id
    )

select * from energy_facts
