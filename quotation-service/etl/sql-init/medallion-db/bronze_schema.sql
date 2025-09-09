-- Create the bronze_insurance schema (database)
CREATE DATABASE IF NOT EXISTS bronze_insurance;

-- Use the bronze_insurance schema
USE bronze_insurance;

-- Create the raw table for transactional data from the Quotation service
-- This table is append-only and stores data as a snapshot
CREATE TABLE IF NOT EXISTS quotations_raw (
    id VARCHAR(36) PRIMARY KEY,
    user_id VARCHAR(36) NOT NULL,
    customer_name VARCHAR(255),
    customer_age INT,
    customer_gender VARCHAR(50),
    customer_income BIGINT,
    customer_occupation VARCHAR(255),
    insurance_type VARCHAR(50),
    vehicle_type VARCHAR(100),
    risk_score INT,
    coverage_amount BIGINT,
    monthly_premium BIGINT,
    premium_term_months INT,
    terms_and_conditions TEXT,
    quote_status VARCHAR(50),
    payment_status VARCHAR(50),
    ingest_ts TIMESTAMP,
    src_system VARCHAR(255)
);

-- Create a flexible raw table for all behavioral events
CREATE TABLE IF NOT EXISTS events_raw (
    event_id VARCHAR(36) PRIMARY KEY,
    event_type VARCHAR(50), -- e.g., 'quote_cancellation', 'quote_accepted'
    quote_id VARCHAR(36),
    user_id VARCHAR(36),
    event_ts TIMESTAMP,
    reason VARCHAR(255),    -- Specific to 'quote_cancellation'
    ingest_ts TIMESTAMP,
    src_system VARCHAR(255)
);
