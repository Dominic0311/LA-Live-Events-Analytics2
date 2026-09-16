# Project Title: End-to-End Event Sales Analytics & Revenue Prediction Engine

**Tech Stack:** Google BigQuery, BigQuery ML (BQML), SQL, Power BI

## Project Overview
Designed and deployed an end-to-end cloud data warehouse, machine learning model, and executive dashboard to analyze global concert performance and forecast show revenue. The pipeline cleans multi-source raw event data in BigQuery, structures it into a dimensional Star Schema, trains a Random Forest regressor directly within SQL, and surfaces predictions alongside residual variance insights in an interactive Power BI dashboard.

## Key Highlights & Architecture
* **Data Cleaning & Pipeline Engineering:** Wrote SQL transformation scripts (`00_data_cleaning.sql`) to sanitize raw currency strings, parse complex attendance/capacity fractions, handle null values, and load cleaned data into a BigQuery Star Schema (`dim_venue` and `fact_event_sales`).
* **In-Database Machine Learning:** Trained a `RANDOM_FOREST_REGRESSOR` model natively using BigQuery ML (BQML) to eliminate external ETL export overhead.
* **Model Performance:** Achieved an $R^2$ score of 94.9% (0.9488) and a Mean Absolute Error (MAE) of ~$470k, successfully capturing global revenue trends across small-scale to stadium-sized concert venues.
* **Executive BI Dashboard:** Built a 3-part Power BI dashboard connected directly to BigQuery predictions (`fact_revenue_predictions`):
  * **Executive KPI Banner:** Top-line portfolio summary tracking total actual vs. predicted revenue ($1.58B vs. $1.51B) and overall model evaluation metrics.
  * **Actual vs. Predicted Alignment:** Interactive scatter plot evaluating show-level model predictions against actual sales using custom granular detail mappings.
  * **Variance & Outlier Identification:** Matrix table and regional clustered bar charts tracking `prediction_variance` to pinpoint regional markets overperforming or underperforming baseline model estimates.

## Executive Analytics Report Summary
* **Top Revenue Markets:** Identified Foxborough, East Rutherford, and Los Angeles as top-performing markets by total actual revenue.
* **Model Variance Insights:** Highlighted pricing inefficiencies and high-demand regional outliers where actual revenue significantly diverged from baseline model expectations.

## Business Value
Identified local market variances where actual revenue diverged from baseline machine estimates—enabling revenue management teams to pinpoint pricing inefficiencies, premium ticket demand spikes, and regional upsell opportunities.
