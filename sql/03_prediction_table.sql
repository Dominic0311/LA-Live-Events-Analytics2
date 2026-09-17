-- =============================================================================
-- Script: 03_prediction_table.sql
-- Description: Generates revenue predictions and creates the final table for Power BI.
-- =============================================================================

CREATE OR REPLACE TABLE `La_event_analysis.fact_revenue_predictions` AS
SELECT
  f.event_id,
  f.event_name,
  f.artist_name,
  f.event_date,
  v.venue_name,
  v.city,
  v.country,
  f.actual_revenue,
  p.predicted_actual_revenue AS predicted_revenue,
  (f.actual_revenue - p.predicted_actual_revenue) AS prediction_variance
FROM ML.PREDICT(
  MODEL `La_event_analysis.revenue_model`,
  (
    SELECT
      f.event_id,
      f.event_name,
      f.artist_name,
      f.event_date,
      f.actual_revenue,
      f.tickets_sold,
      f.avg_ticket_price,
      f.occupancy_rate,
      v.venue_name,
      v.venue_capacity,
      v.city,
      v.country
    FROM `La_event_analysis.fact_event_sales` f
    JOIN `La_event_analysis.dim_venue` v
      ON f.venue_key = v.venue_key
  )
) p
JOIN `La_event_analysis.fact_event_sales` f ON p.event_id = f.event_id
JOIN `La_event_analysis.dim_venue` v ON f.venue_key = v.venue_key;
