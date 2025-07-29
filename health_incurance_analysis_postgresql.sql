create database health_data;

create table sample_submission
(
id  INT PRIMARY KEY,
Response INT
);
SELECT * FROM sample_submission;



CREATE TABLE test(
    id                INT PRIMARY KEY,
    gender            VARCHAR(10),        
    age               INT,
    driving_license   BOOLEAN,              
    region_code       INT,
    previously_insured BOOLEAN,            
    vehicle_age       VARCHAR(20),         
    vehicle_damage    BOOLEAN,             
    annual_premium    INT,
    policy_sales_channel INT,
    vintage           INT
);
SELECT * FROM test;

ALTER TABLE test
ALTER COLUMN region_code TYPE FLOAT;

ALTER TABLE test
ALTER COLUMN annual_premium TYPE FLOAT;

ALTER TABLE test
ALTER COLUMN policy_sales_channel TYPE FLOAT;


SELECT * FROM test;



CREATE TABLE train(
id                INT PRIMARY KEY,
    gender            VARCHAR(10),        
    age               INT,
    driving_license   BOOLEAN,              
    region_code       FLOAT,
    previously_insured BOOLEAN,            
    vehicle_age       VARCHAR(20),         
    vehicle_damage    BOOLEAN,             
    annual_premium    FLOAT,
    policy_sales_channel FLOAT,
    vintage           INT,
	Response          BOOLEAN
)

SELECT * FROM train;


--Total interested vs uninterested customers

SELECT
	RESPONSE,
	COUNT(*) AS COUNT
FROM
	TRAIN
GROUP BY
	RESPONSE;



-- Average annual premium by interest
SELECT
	RESPONSE,
	ROUND(AVG(ANNUAL_PREMIUM)::NUMERIC, 2) AS AVG_PREMIUM
FROM
	TRAIN
GROUP BY
	RESPONSE;
	

--Interest rate by gender
SELECT
	GENDER,
	COUNT(*) AS TOTAL,
	SUM(
		CASE
			WHEN RESPONSE = 1 THEN 1
			ELSE 0
		END
	) AS INTERESTED,
	ROUND(
		100.0 * SUM(
			CASE
				WHEN RESPONSE = 1 THEN 1
				ELSE 0
			END
		)::NUMERIC / COUNT(*),
		2
	) AS INTEREST_RATE
FROM
	TRAIN
GROUP BY
	GENDER;


--Vehicle damage vs response
SELECT
	VEHICLE_DAMAGE,
	RESPONSE,
	COUNT(*) AS TOTAL
FROM
	TRAIN
GROUP BY
	VEHICLE_DAMAGE,
	RESPONSE
ORDER BY
	VEHICLE_DAMAGE,
	RESPONSE;

	

--Interest by vehicle age group
SELECT
	VEHICLE_AGE,
	RESPONSE,
	COUNT(*) AS CUSTOMERS
FROM
	TRAIN
GROUP BY
	VEHICLE_AGE,
	RESPONSE
ORDER BY
	VEHICLE_AGE,
	RESPONSE;



--Top 5 regions with highest interest rate
SELECT
	REGION_CODE,
	COUNT(*) AS TOTAL,
	SUM(RESPONSE) AS INTERESTED,
	ROUND(100.0 * SUM(RESPONSE)::DECIMAL / COUNT(*), 2) AS INTEREST_RATE
FROM
	TRAIN
GROUP BY
	REGION_CODE
ORDER BY
	INTEREST_RATE DESC
LIMIT
	5;
	

--Policy sales channels sorted by customer volume
SELECT
	POLICY_SALES_CHANNEL,
	COUNT(*) AS CUSTOMER_COUNT
FROM
	TRAIN
GROUP BY
	POLICY_SALES_CHANNEL
ORDER BY
	CUSTOMER_COUNT DESC LIMIT
	10;


--Average premium by vehicle damage status
SELECT
	VEHICLE_DAMAGE,
	ROUND(AVG(ANNUAL_PREMIUM)::NUMERIC, 2) AS AVG_PREMIUM
FROM
	TRAIN
GROUP BY
	VEHICLE_DAMAGE;



