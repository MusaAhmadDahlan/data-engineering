CREATE OR REPLACE TABLE GIC.INSIGHTS.EXTERNAL_FUNDS (
    DATE DATE,
    FINANCIAL_TYPE VARCHAR,
    SYMBOL VARCHAR,
    SECURITY_NAME VARCHAR,
    ISIN VARCHAR,
    PRICE FLOAT,
    QUANTITY FLOAT,
    REALISED_PL FLOAT,
    MARKET_VALUE FLOAT,
    FUND VARCHAR
);