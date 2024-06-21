CREATE OR REPLACE STAGE GIC.INSIGHTS.SAP_STAGE
    URL = 's3://verified-s3-bucket/funds_bucket/'
    STORAGE_INTEGRATION = my_s3_integration;