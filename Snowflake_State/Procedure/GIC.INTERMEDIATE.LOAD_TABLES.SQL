CREATE OR REPLACE PROCEDURE GIC.INTERMEDIATE.LOAD_TABLES()
RETURNS STRING NOT NULL
LANGUAGE JAVASCRIPT
EXECUTE AS CALLER
AS
$$
try{

//-- THIS PROCEDURE CAN INCLUDE MORE TRANSFORMATIONS, RUNTIME CHECKS AND VALIDATION OF BUSINESS LOGIC

}
catch (err){

//--Errors can be logged here as well
//--This section be used to send alerts or notifications in the form of email or text

}

$$