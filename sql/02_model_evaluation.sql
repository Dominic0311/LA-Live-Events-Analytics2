-- =============================================================================
-- Script: 02_model_evaluation.sql
-- Description: Evaluates the trained BQML model performance metrics.
-- =============================================================================

SELECT
  *
FROM ML.EVALUATE(
  MODEL `La_event_analysis.revenue_model`
);
