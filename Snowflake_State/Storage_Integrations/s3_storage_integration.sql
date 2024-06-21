CREATE OR REPLACE STORAGE INTEGRATION s3_storage_integration
    TYPE = EXTERNAL_STAGE
    STORAGE_PROVIDER = S3
    ENABLED = TRUE
    STORAGE_AWS_ROLE_ARN = 'arn:aws:iam::your-account-id:role/gic-snowflake-role'
    STORAGE_ALLOWED_LOCATIONS = ('s3://verified-s3-bucket/');