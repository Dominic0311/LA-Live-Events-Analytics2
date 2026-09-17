-- =============================================================================
-- Script: 00_data_cleaning.sql
-- Description: Creates the staging table, dimension table (dim_venue), and 
--              fact table (fact_event_sales) in BigQuery.
-- =============================================================================

-- Step 1: Create Dimension Table (dim_venue)
CREATE OR REPLACE TABLE `La_event_analysis.dim_venue` AS
SELECT
  FARM_FINGERPRINT(CONCAT(venue_name, '_', city)) AS venue_key,
  venue_name,
  city,
  country,
  MAX(venue_capacity) AS venue_capacity
FROM `La_event_analysis.stg_cleaned_events`
WHERE venue_name IS NOT NULL
GROUP BY 1, 2, 3, 4;

-- Step 2: Create Fact Table (fact_event_sales)
CREATE OR REPLACE TABLE `La_event_analysis.fact_event_sales` AS
SELECT
  event_id,
  FARM_FINGERPRINT(CONCAT(venue_name, '_', city)) AS venue_key,
  event_name,
  artist_name,
  event_date,
  tickets_sold,
  avg_ticket_price,
  occupancy_rate,
  actual_revenue
FROM `La_event_analysis.stg_cleaned_events`
WHERE actual_revenue IS NOT NULL AND actual_revenue > 0;
