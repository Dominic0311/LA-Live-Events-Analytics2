Project Overview
Designed and deployed an end-to-end cloud data warehouse, machine learning model, and executive dashboard to analyze global concert performance and forecast show revenue. The pipeline ingests multi-source data into a dimensional Star Schema in BigQuery, trains a Random Forest regressor directly within SQL, and surfaces predictions alongside residual variance insights in an interactive Power BI dashboard.

Key Highlights & Architecture
Cloud Data Modeling: Structured a Star Schema architecture in Google BigQuery (dim_venue and fact_event_sales) to model historical event data across global venue capacity, ticket pricing, and location attributes.

In-Database Machine Learning: Trained a RANDOM_FOREST_REGRESSOR model natively using BigQuery ML (BQML) to eliminate external ETL export overhead.

Model Performance: Achieved an R 
2
  score of 94.9% (0.9488) and a Mean Absolute Error (MAE) of ~$470k, successfully capturing global revenue trends across small-scale to stadium-sized concert venues.

Executive BI Dashboard: Built a 3-part Power BI dashboard connected directly to BigQuery predictions (fact_revenue_predictions):

Executive KPI Banner: Top-line portfolio summary tracking total actual vs. predicted revenue ($1.58B vs. $1.51B) and overall model evaluation metrics.

Actual vs. Predicted Alignment: Interactive scatter plot evaluating show-level model predictions against actual sales using custom granular detail mappings.

Variance & Outlier Identification: Matrix table and regional clustered bar charts tracking prediction_variance to pinpoint regional markets overperforming or underperforming baseline model estimates.

Business Value
Identified local market variances where actual revenue diverged from baseline machine estimates—enabling revenue management teams to pinpoint pricing inefficiencies, premium ticket demand spikes, and regional upsell opportunities.
