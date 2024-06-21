CREATE OR REPLACE PROCEDURE GIC.STAGING.LOAD_STAGING_TABLES()
RETURNS STRING NOT NULL
LANGUAGE JAVASCRIPT
EXECUTE AS CALLER
AS
$$
try{

//-- INGEST FUNDS DATA FROM APPLEBEAD CSV
var cmd = 
`
COPY INTO GIC.STAGING.EXTERNAL_FUNDS
FROM (
    SELECT
        CASE 
            WHEN REGEXP_SUBSTR(METADATA$FILENAME, '\\d{2}-\\d{2}-\\d{4}') IS NOT NULL THEN 
                TO_DATE(REGEXP_SUBSTR(METADATA$FILENAME, '\\d{2}-\\d{2}-\\d{4}'), 'DD-MM-YYYY')
            WHEN REGEXP_SUBSTR(METADATA$FILENAME, '\\d{2}_\\d{2}_\\d{4}') IS NOT NULL THEN 
                TO_DATE(REGEXP_SUBSTR(METADATA$FILENAME, '\\d{2}_\\d{2}_\\d{4}'), 'DD_MM_YYYY')
            WHEN REGEXP_SUBSTR(METADATA$FILENAME, '\\d{4}-\\d{2}-\\d{2}') IS NOT NULL THEN 
                TO_DATE(REGEXP_SUBSTR(METADATA$FILENAME, '\\d{4}-\\d{2}-\\d{2}'), 'YYYY-MM-DD')
            WHEN REGEXP_SUBSTR(METADATA$FILENAME, '\\d{8}') IS NOT NULL THEN 
                TO_DATE(REGEXP_SUBSTR(METADATA$FILENAME, '\\d{8}'), 'YYYYMMDD')
            WHEN REGEXP_SUBSTR(METADATA$FILENAME, '\\d{2}-\\d{2}-\\d{4}') IS NOT NULL THEN 
                TO_DATE(REGEXP_SUBSTR(METADATA$FILENAME, '\\d{2}-\\d{2}-\\d{4}'), 'MM-DD-YYYY')
            ELSE NULL 
        END AS DATE,
        $1, 
        $2, 
        $3, 
        $4, 
        $5, 
        $6,
        $7,
        $8,
        'APPLEBEAD' 
    FROM @GIC.INSIGHTS.SAP_STAGE (PATTERN => '.*Applebead.*[.]csv')
)
FILE_FORMAT = (TYPE = CSV FIELD_OPTIONALLY_ENCLOSED_BY='"' SKIP_HEADER=1)
ON_ERROR = SKIP_FILE
;
`
var run_cmd = snowflake.createStatement({sqlText: cmd});
var result = run_cmd.execute();

//-- LOGGING TO A LOG TABLE CAN BE INSERTED AFTER EVERY INGESTION

//-- INGEST FUNDS DATA FROM BELAWARE CSV

var cmd = 
`
COPY INTO GIC.STAGING.EXTERNAL_FUNDS
FROM (
    SELECT
        CASE 
            WHEN REGEXP_SUBSTR(METADATA$FILENAME, '\\d{2}-\\d{2}-\\d{4}') IS NOT NULL THEN 
                TO_DATE(REGEXP_SUBSTR(METADATA$FILENAME, '\\d{2}-\\d{2}-\\d{4}'), 'DD-MM-YYYY')
            WHEN REGEXP_SUBSTR(METADATA$FILENAME, '\\d{2}_\\d{2}_\\d{4}') IS NOT NULL THEN 
                TO_DATE(REGEXP_SUBSTR(METADATA$FILENAME, '\\d{2}_\\d{2}_\\d{4}'), 'DD_MM_YYYY')
            WHEN REGEXP_SUBSTR(METADATA$FILENAME, '\\d{4}-\\d{2}-\\d{2}') IS NOT NULL THEN 
                TO_DATE(REGEXP_SUBSTR(METADATA$FILENAME, '\\d{4}-\\d{2}-\\d{2}'), 'YYYY-MM-DD')
            WHEN REGEXP_SUBSTR(METADATA$FILENAME, '\\d{8}') IS NOT NULL THEN 
                TO_DATE(REGEXP_SUBSTR(METADATA$FILENAME, '\\d{8}'), 'YYYYMMDD')
            WHEN REGEXP_SUBSTR(METADATA$FILENAME, '\\d{2}-\\d{2}-\\d{4}') IS NOT NULL THEN 
                TO_DATE(REGEXP_SUBSTR(METADATA$FILENAME, '\\d{2}-\\d{2}-\\d{4}'), 'MM-DD-YYYY')
            ELSE NULL 
        END AS DATE,
        $1, 
        $2, 
        $3, 
        $4, 
        $5, 
        $6,
        $7,
        $8,
        'BELAWARE' 
    FROM @GIC.INSIGHTS.SAP_STAGE (PATTERN => '.*Belaware.*[.]csv')
)
FILE_FORMAT = (TYPE = CSV FIELD_OPTIONALLY_ENCLOSED_BY='"' SKIP_HEADER=1)
ON_ERROR = SKIP_FILE
;
`
var run_cmd = snowflake.createStatement({sqlText: cmd});
var result = run_cmd.execute();

//-- LOGGING TO A LOG TABLE CAN BE INSERTED AFTER EVERY INGESTION

//-- INGEST FUNDS DATA FROM WHITESTONE CSV

var cmd = 
`
COPY INTO GIC.STAGING.EXTERNAL_FUNDS
FROM (
    SELECT 
        CASE 
            WHEN REGEXP_SUBSTR(METADATA$FILENAME, '\\d{2}-\\d{2}-\\d{4}') IS NOT NULL THEN 
                TO_DATE(REGEXP_SUBSTR(METADATA$FILENAME, '\\d{2}-\\d{2}-\\d{4}'), 'DD-MM-YYYY')
            WHEN REGEXP_SUBSTR(METADATA$FILENAME, '\\d{2}_\\d{2}_\\d{4}') IS NOT NULL THEN 
                TO_DATE(REGEXP_SUBSTR(METADATA$FILENAME, '\\d{2}_\\d{2}_\\d{4}'), 'DD_MM_YYYY')
            WHEN REGEXP_SUBSTR(METADATA$FILENAME, '\\d{4}-\\d{2}-\\d{2}') IS NOT NULL THEN 
                TO_DATE(REGEXP_SUBSTR(METADATA$FILENAME, '\\d{4}-\\d{2}-\\d{2}'), 'YYYY-MM-DD')
            WHEN REGEXP_SUBSTR(METADATA$FILENAME, '\\d{8}') IS NOT NULL THEN 
                TO_DATE(REGEXP_SUBSTR(METADATA$FILENAME, '\\d{8}'), 'YYYYMMDD')
            WHEN REGEXP_SUBSTR(METADATA$FILENAME, '\\d{2}-\\d{2}-\\d{4}') IS NOT NULL THEN 
                TO_DATE(REGEXP_SUBSTR(METADATA$FILENAME, '\\d{2}-\\d{2}-\\d{4}'), 'MM-DD-YYYY')
            ELSE NULL 
        END AS DATE,
        $1, 
        $2, 
        $3, 
        $4, 
        $5, 
        $6,
        $7,
        $8,
        'FUND WHITESTONE' 
    FROM @GIC.INSIGHTS.SAP_STAGE (PATTERN => '.*Fund[ ]Whitestone.*[.]csv')
)
FILE_FORMAT = (TYPE = CSV FIELD_OPTIONALLY_ENCLOSED_BY='"' SKIP_HEADER=1)
ON_ERROR = SKIP_FILE
;
`
var run_cmd = snowflake.createStatement({sqlText: cmd});
var result = run_cmd.execute();

//-- LOGGING TO A LOG TABLE CAN BE INSERTED AFTER EVERY INGESTION

//-- INGEST FUNDS DATA FROM LEEDER CSV

var cmd = 
`
COPY INTO GIC.STAGING.EXTERNAL_FUNDS
FROM (
    SELECT 
        CASE 
            WHEN REGEXP_SUBSTR(METADATA$FILENAME, '\\d{2}-\\d{2}-\\d{4}') IS NOT NULL THEN 
                TO_DATE(REGEXP_SUBSTR(METADATA$FILENAME, '\\d{2}-\\d{2}-\\d{4}'), 'DD-MM-YYYY')
            WHEN REGEXP_SUBSTR(METADATA$FILENAME, '\\d{2}_\\d{2}_\\d{4}') IS NOT NULL THEN 
                TO_DATE(REGEXP_SUBSTR(METADATA$FILENAME, '\\d{2}_\\d{2}_\\d{4}'), 'DD_MM_YYYY')
            WHEN REGEXP_SUBSTR(METADATA$FILENAME, '\\d{4}-\\d{2}-\\d{2}') IS NOT NULL THEN 
                TO_DATE(REGEXP_SUBSTR(METADATA$FILENAME, '\\d{4}-\\d{2}-\\d{2}'), 'YYYY-MM-DD')
            WHEN REGEXP_SUBSTR(METADATA$FILENAME, '\\d{8}') IS NOT NULL THEN 
                TO_DATE(REGEXP_SUBSTR(METADATA$FILENAME, '\\d{8}'), 'YYYYMMDD')
            WHEN REGEXP_SUBSTR(METADATA$FILENAME, '\\d{2}-\\d{2}-\\d{4}') IS NOT NULL THEN 
                TO_DATE(REGEXP_SUBSTR(METADATA$FILENAME, '\\d{2}-\\d{2}-\\d{4}'), 'MM-DD-YYYY')
            ELSE NULL 
        END AS DATE,
        $1, 
        $2, 
        $3, 
        $4, 
        $5, 
        $6,
        $7,
        $8,
        'LEEDER' 
    FROM @GIC.INSIGHTS.SAP_STAGE (PATTERN => '.*Leeder.*[.]csv')
)
FILE_FORMAT = (TYPE = CSV FIELD_OPTIONALLY_ENCLOSED_BY='"' SKIP_HEADER=1)
ON_ERROR = SKIP_FILE
;
`
var run_cmd = snowflake.createStatement({sqlText: cmd});
var result = run_cmd.execute();

//-- LOGGING TO A LOG TABLE CAN BE INSERTED AFTER EVERY INGESTION

//-- INGEST FUNDS DATA FROM MAGNUM CSV

var cmd = 
`
COPY INTO GIC.STAGING.EXTERNAL_FUNDS
FROM (
    SELECT 
        CASE 
            WHEN REGEXP_SUBSTR(METADATA$FILENAME, '\\d{2}-\\d{2}-\\d{4}') IS NOT NULL THEN 
                TO_DATE(REGEXP_SUBSTR(METADATA$FILENAME, '\\d{2}-\\d{2}-\\d{4}'), 'DD-MM-YYYY')
            WHEN REGEXP_SUBSTR(METADATA$FILENAME, '\\d{2}_\\d{2}_\\d{4}') IS NOT NULL THEN 
                TO_DATE(REGEXP_SUBSTR(METADATA$FILENAME, '\\d{2}_\\d{2}_\\d{4}'), 'DD_MM_YYYY')
            WHEN REGEXP_SUBSTR(METADATA$FILENAME, '\\d{4}-\\d{2}-\\d{2}') IS NOT NULL THEN 
                TO_DATE(REGEXP_SUBSTR(METADATA$FILENAME, '\\d{4}-\\d{2}-\\d{2}'), 'YYYY-MM-DD')
            WHEN REGEXP_SUBSTR(METADATA$FILENAME, '\\d{8}') IS NOT NULL THEN 
                TO_DATE(REGEXP_SUBSTR(METADATA$FILENAME, '\\d{8}'), 'YYYYMMDD')
            WHEN REGEXP_SUBSTR(METADATA$FILENAME, '\\d{2}-\\d{2}-\\d{4}') IS NOT NULL THEN 
                TO_DATE(REGEXP_SUBSTR(METADATA$FILENAME, '\\d{2}-\\d{2}-\\d{4}'), 'MM-DD-YYYY')
            ELSE NULL 
        END AS DATE,
        $1, 
        $2, 
        $3, 
        $4, 
        $5, 
        $6,
        $7,
        $8,
        'MAGNUM' 
    FROM @GIC.INSIGHTS.SAP_STAGE (PATTERN => '.*Magnum.*[.]csv')
)
FILE_FORMAT = (TYPE = CSV FIELD_OPTIONALLY_ENCLOSED_BY='"' SKIP_HEADER=1)
ON_ERROR = SKIP_FILE
;
`
var run_cmd = snowflake.createStatement({sqlText: cmd});
var result = run_cmd.execute();

//-- LOGGING TO A LOG TABLE CAN BE INSERTED AFTER EVERY INGESTION

//-- INGEST FUNDS DATA FROM WALLINGTON CSV

var cmd = 
`
COPY INTO GIC.STAGING.EXTERNAL_FUNDS
FROM (
    SELECT 
        CASE 
            WHEN REGEXP_SUBSTR(METADATA$FILENAME, '\\d{2}-\\d{2}-\\d{4}') IS NOT NULL THEN 
                TO_DATE(REGEXP_SUBSTR(METADATA$FILENAME, '\\d{2}-\\d{2}-\\d{4}'), 'DD-MM-YYYY')
            WHEN REGEXP_SUBSTR(METADATA$FILENAME, '\\d{2}_\\d{2}_\\d{4}') IS NOT NULL THEN 
                TO_DATE(REGEXP_SUBSTR(METADATA$FILENAME, '\\d{2}_\\d{2}_\\d{4}'), 'DD_MM_YYYY')
            WHEN REGEXP_SUBSTR(METADATA$FILENAME, '\\d{4}-\\d{2}-\\d{2}') IS NOT NULL THEN 
                TO_DATE(REGEXP_SUBSTR(METADATA$FILENAME, '\\d{4}-\\d{2}-\\d{2}'), 'YYYY-MM-DD')
            WHEN REGEXP_SUBSTR(METADATA$FILENAME, '\\d{8}') IS NOT NULL THEN 
                TO_DATE(REGEXP_SUBSTR(METADATA$FILENAME, '\\d{8}'), 'YYYYMMDD')
            WHEN REGEXP_SUBSTR(METADATA$FILENAME, '\\d{2}-\\d{2}-\\d{4}') IS NOT NULL THEN 
                TO_DATE(REGEXP_SUBSTR(METADATA$FILENAME, '\\d{2}-\\d{2}-\\d{4}'), 'MM-DD-YYYY')
            ELSE NULL 
        END AS DATE,
        $1, 
        $2, 
        $3, 
        $4, 
        $5, 
        $6,
        $7,
        $8,
        'WALLINGTON' 
    FROM @GIC.INSIGHTS.SAP_STAGE (PATTERN => '.*mend-report[ ]Wallington.*[.]csv')
)
FILE_FORMAT = (TYPE = CSV FIELD_OPTIONALLY_ENCLOSED_BY='"' SKIP_HEADER=1)
ON_ERROR = SKIP_FILE
;
`
var run_cmd = snowflake.createStatement({sqlText: cmd});
var result = run_cmd.execute();

//-- LOGGING TO A LOG TABLE CAN BE INSERTED AFTER EVERY INGESTION

//-- INGEST FUNDS DATA FROM GOHEN CSV

var cmd = 
`
COPY INTO GIC.STAGING.EXTERNAL_FUNDS
FROM (
    SELECT 
        CASE 
            WHEN REGEXP_SUBSTR(METADATA$FILENAME, '\\d{2}-\\d{2}-\\d{4}') IS NOT NULL THEN 
                TO_DATE(REGEXP_SUBSTR(METADATA$FILENAME, '\\d{2}-\\d{2}-\\d{4}'), 'DD-MM-YYYY')
            WHEN REGEXP_SUBSTR(METADATA$FILENAME, '\\d{2}_\\d{2}_\\d{4}') IS NOT NULL THEN 
                TO_DATE(REGEXP_SUBSTR(METADATA$FILENAME, '\\d{2}_\\d{2}_\\d{4}'), 'DD_MM_YYYY')
            WHEN REGEXP_SUBSTR(METADATA$FILENAME, '\\d{4}-\\d{2}-\\d{2}') IS NOT NULL THEN 
                TO_DATE(REGEXP_SUBSTR(METADATA$FILENAME, '\\d{4}-\\d{2}-\\d{2}'), 'YYYY-MM-DD')
            WHEN REGEXP_SUBSTR(METADATA$FILENAME, '\\d{8}') IS NOT NULL THEN 
                TO_DATE(REGEXP_SUBSTR(METADATA$FILENAME, '\\d{8}'), 'YYYYMMDD')
            WHEN REGEXP_SUBSTR(METADATA$FILENAME, '\\d{2}-\\d{2}-\\d{4}') IS NOT NULL THEN 
                TO_DATE(REGEXP_SUBSTR(METADATA$FILENAME, '\\d{2}-\\d{2}-\\d{4}'), 'MM-DD-YYYY')
            ELSE NULL 
        END AS DATE,
        $1, 
        $2, 
        $3, 
        $4, 
        $5, 
        $6,
        $7,
        $8,
        'GOHEN' 
    FROM @GIC.INSIGHTS.SAP_STAGE (PATTERN => '.*Report-of-Gohen.*[.]csv')
)
FILE_FORMAT = (TYPE = CSV FIELD_OPTIONALLY_ENCLOSED_BY='"' SKIP_HEADER=1)
ON_ERROR = SKIP_FILE
;
`
var run_cmd = snowflake.createStatement({sqlText: cmd});
var result = run_cmd.execute();

//-- LOGGING TO A LOG TABLE CAN BE INSERTED AFTER EVERY INGESTION

//-- INGEST FUNDS DATA FROM CATALYSM CSV

var cmd = 
`
COPY INTO GIC.STAGING.EXTERNAL_FUNDS
FROM (
    SELECT 
        CASE 
            WHEN REGEXP_SUBSTR(METADATA$FILENAME, '\\d{2}-\\d{2}-\\d{4}') IS NOT NULL THEN 
                TO_DATE(REGEXP_SUBSTR(METADATA$FILENAME, '\\d{2}-\\d{2}-\\d{4}'), 'DD-MM-YYYY')
            WHEN REGEXP_SUBSTR(METADATA$FILENAME, '\\d{2}_\\d{2}_\\d{4}') IS NOT NULL THEN 
                TO_DATE(REGEXP_SUBSTR(METADATA$FILENAME, '\\d{2}_\\d{2}_\\d{4}'), 'DD_MM_YYYY')
            WHEN REGEXP_SUBSTR(METADATA$FILENAME, '\\d{4}-\\d{2}-\\d{2}') IS NOT NULL THEN 
                TO_DATE(REGEXP_SUBSTR(METADATA$FILENAME, '\\d{4}-\\d{2}-\\d{2}'), 'YYYY-MM-DD')
            WHEN REGEXP_SUBSTR(METADATA$FILENAME, '\\d{8}') IS NOT NULL THEN 
                TO_DATE(REGEXP_SUBSTR(METADATA$FILENAME, '\\d{8}'), 'YYYYMMDD')
            WHEN REGEXP_SUBSTR(METADATA$FILENAME, '\\d{2}-\\d{2}-\\d{4}') IS NOT NULL THEN 
                TO_DATE(REGEXP_SUBSTR(METADATA$FILENAME, '\\d{2}-\\d{2}-\\d{4}'), 'MM-DD-YYYY')
            ELSE NULL 
        END AS DATE,
        $1, 
        $2, 
        $3, 
        $4, 
        $5, 
        $6,
        $7,
        $8,
        'CATALYSM' 
    FROM @GIC.INSIGHTS.SAP_STAGE (PATTERN => '.*rpt-Catalysm.*[.]csv')
)
FILE_FORMAT = (TYPE = CSV FIELD_OPTIONALLY_ENCLOSED_BY='"' SKIP_HEADER=1)
ON_ERROR = SKIP_FILE
;
`
var run_cmd = snowflake.createStatement({sqlText: cmd});
var result = run_cmd.execute();

//-- LOGGING TO A LOG TABLE CAN BE INSERTED AFTER EVERY INGESTION

//-- INGEST FUNDS DATA FROM TRUSTMIND CSV

var cmd = 
`
COPY INTO GIC.STAGING.EXTERNAL_FUNDS
FROM (
    SELECT 
        CASE 
            WHEN REGEXP_SUBSTR(METADATA$FILENAME, '\\d{2}-\\d{2}-\\d{4}') IS NOT NULL THEN 
                TO_DATE(REGEXP_SUBSTR(METADATA$FILENAME, '\\d{2}-\\d{2}-\\d{4}'), 'DD-MM-YYYY')
            WHEN REGEXP_SUBSTR(METADATA$FILENAME, '\\d{2}_\\d{2}_\\d{4}') IS NOT NULL THEN 
                TO_DATE(REGEXP_SUBSTR(METADATA$FILENAME, '\\d{2}_\\d{2}_\\d{4}'), 'DD_MM_YYYY')
            WHEN REGEXP_SUBSTR(METADATA$FILENAME, '\\d{4}-\\d{2}-\\d{2}') IS NOT NULL THEN 
                TO_DATE(REGEXP_SUBSTR(METADATA$FILENAME, '\\d{4}-\\d{2}-\\d{2}'), 'YYYY-MM-DD')
            WHEN REGEXP_SUBSTR(METADATA$FILENAME, '\\d{8}') IS NOT NULL THEN 
                TO_DATE(REGEXP_SUBSTR(METADATA$FILENAME, '\\d{8}'), 'YYYYMMDD')
            WHEN REGEXP_SUBSTR(METADATA$FILENAME, '\\d{2}-\\d{2}-\\d{4}') IS NOT NULL THEN 
                TO_DATE(REGEXP_SUBSTR(METADATA$FILENAME, '\\d{2}-\\d{2}-\\d{4}'), 'MM-DD-YYYY')
            ELSE NULL 
        END AS DATE,
        $1, 
        $2, 
        $3, 
        $4, 
        $5, 
        $6,
        $7,
        $8,
        'TRUSTMIND' 
    FROM @GIC.INSIGHTS.SAP_STAGE (PATTERN => '.*TT_monthly_Trustmind.*[.]csv')
)
FILE_FORMAT = (TYPE = CSV FIELD_OPTIONALLY_ENCLOSED_BY='"' SKIP_HEADER=1)
ON_ERROR = SKIP_FILE
;
`
var run_cmd = snowflake.createStatement({sqlText: cmd});
var result = run_cmd.execute();

//-- LOGGING TO A LOG TABLE CAN BE INSERTED AFTER EVERY INGESTION

//-- INGEST FUNDS DATA FROM VIRTOUS CSV

var cmd = 
`
COPY INTO GIC.STAGING.EXTERNAL_FUNDS
FROM (
    SELECT 
        CASE 
            WHEN REGEXP_SUBSTR(METADATA$FILENAME, '\\d{2}-\\d{2}-\\d{4}') IS NOT NULL THEN 
                TO_DATE(REGEXP_SUBSTR(METADATA$FILENAME, '\\d{2}-\\d{2}-\\d{4}'), 'DD-MM-YYYY')
            WHEN REGEXP_SUBSTR(METADATA$FILENAME, '\\d{2}_\\d{2}_\\d{4}') IS NOT NULL THEN 
                TO_DATE(REGEXP_SUBSTR(METADATA$FILENAME, '\\d{2}_\\d{2}_\\d{4}'), 'DD_MM_YYYY')
            WHEN REGEXP_SUBSTR(METADATA$FILENAME, '\\d{4}-\\d{2}-\\d{2}') IS NOT NULL THEN 
                TO_DATE(REGEXP_SUBSTR(METADATA$FILENAME, '\\d{4}-\\d{2}-\\d{2}'), 'YYYY-MM-DD')
            WHEN REGEXP_SUBSTR(METADATA$FILENAME, '\\d{8}') IS NOT NULL THEN 
                TO_DATE(REGEXP_SUBSTR(METADATA$FILENAME, '\\d{8}'), 'YYYYMMDD')
            WHEN REGEXP_SUBSTR(METADATA$FILENAME, '\\d{2}-\\d{2}-\\d{4}') IS NOT NULL THEN 
                TO_DATE(REGEXP_SUBSTR(METADATA$FILENAME, '\\d{2}-\\d{2}-\\d{4}'), 'MM-DD-YYYY')
            ELSE NULL 
        END AS DATE,
        $1, 
        $2, 
        $3, 
        $4, 
        $5, 
        $6,
        $7,
        $8,
        'VIRTOUS' 
    FROM @GIC.INSIGHTS.SAP_STAGE (PATTERN => '.*Virtous.*[.]csv')
)
FILE_FORMAT = (TYPE = CSV FIELD_OPTIONALLY_ENCLOSED_BY='"' SKIP_HEADER=1)
ON_ERROR = SKIP_FILE
;
`
var run_cmd = snowflake.createStatement({sqlText: cmd});
var result = run_cmd.execute();

//-- LOGGING TO A LOG TABLE CAN BE INSERTED AFTER EVERY INGESTION

//-- POPULATE INTERMEDIATE LAYER TABLES FROM STAGING LAYER
var cmd = 
`
INSERT INTO GIC.INTERMEDIATE.EXTERNAL_FUNDS
SELECT * FROM GIC.RAW.EXTERNAL_FUNDS
;
`
var run_cmd = snowflake.createStatement({sqlText: cmd});
var result = run_cmd.execute();

//-- PURGE STAGING TABLE FOR FUTURE INCREMENTAL RUNS
var cmd = 
`
DELETE FROM GIC.RAW.EXTERNAL_FUNDS
;
`
var run_cmd = snowflake.createStatement({sqlText: cmd});
var result = run_cmd.execute();

}
catch (err){

//--Errors can be logged here as well
//--This section be used to send alerts or notifications in the form of email or text

}

$$