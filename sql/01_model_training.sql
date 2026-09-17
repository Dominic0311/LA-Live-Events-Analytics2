CREATE OR REPLACE MODEL `La_event_analysis.model_revenue_rf`
OPTIONS(
  model_type = 'RANDOM_FOREST_REGRESSOR',
  input_label_cols = ['revenue'],
  num_parallel_tree = 20,              -- Reduced to 20 trees for much faster training
  data_split_method = 'AUTO_SPLIT'
) AS
SELECT 
  v.venue_capacity,
  v.country,
  f.tickets_sold,
  f.avg_ticket_price,
  f.revenue
FROM `La_event_analysis.fact_event_sales` f
JOIN `La_event_analysis.dim_venue` v 
  ON f.venue_key = v.venue_key
WHERE f.revenue IS NOT NULL 
  AND f.revenue > 0;
