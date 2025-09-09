-- Create the gold_insurance schema (database)
CREATE DATABASE IF NOT EXISTS gold_insurance;

-- Use the gold_insurance schema
USE gold_insurance;

-- Create an aggregated fact table for daily quote metrics
-- This table is optimized for reporting and dashboarding
CREATE TABLE IF NOT EXISTS daily_quote_metrics (
    metric_date DATE PRIMARY KEY,
    total_quotes_created BIGINT,
    total_quotes_accepted BIGINT,
    total_quotes_cancelled BIGINT,
    avg_premium_total DECIMAL(10, 2),
    avg_premium_life DECIMAL(10, 2),
    avg_premium_vehicle DECIMAL(10, 2),
    conversion_rate DECIMAL(5, 2),
    cancellation_rate DECIMAL(5, 2)
);

