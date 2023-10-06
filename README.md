# Global Sustainable Energy Data

Analytics engineering project on the global sustainable emergy data from [Kaggle](https://www.kaggle.com/datasets/anshtanwar/global-data-on-sustainable-energy) using the ELT framework. <br>
This task is carried out in three phases:
- Ingestion:
  - Extraction of data and storage into Google cloud storage
  - Loading the data into BigQuery
    
    The tools used in this phase are; Python, Apcahe Airflow and GCP
    
- Transformation:
  - Modelling of schemas
  - Transforming the data

     The tools used in this phase are; SQL, dbt cloud, BigQuery

---

Ingestion

This phase See the collection of data from the open repositoy in Kaggle, link above, and loaded in a Google cloud storage bucket.

---

Transformation

Transformed the data in the warehouse using DBT.

---
