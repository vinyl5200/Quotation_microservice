-- Create the silver_insurance schema (database)
CREATE DATABASE IF NOT EXISTS silver_insurance;

-- Use the silver_insurance schema
USE silver_insurance;

-- Create a master table for quotations and events
-- Data will be cleansed, enriched, and standardized here.
CREATE TABLE IF NOT EXISTS quotations_silver (
    quote_id VARCHAR(36) PRIMARY KEY,
    user_id VARCHAR(36) NOT NULL,
    customer_age INT,
    customer_gender VARCHAR(50),
    customer_income BIGINT,
    insurance_type VARCHAR(50),
    monthly_premium DECIMAL(10, 2),
    coverage_amount BIGINT,
    risk_score INT,
    premium_term_months INT,
    
    -- New columns for event outcomes
    is_accepted BOOLEAN,
    is_cancelled BOOLEAN,
    cancellation_reason VARCHAR(255),
    
    quote_created_ts TIMESTAMP,
    quote_accepted_ts TIMESTAMP,
    quote_cancelled_ts TIMESTAMP
);
