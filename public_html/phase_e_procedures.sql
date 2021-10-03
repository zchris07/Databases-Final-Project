-- stefano tusa stusa2 christopher zou czou8

DELIMITER //

-- Get the model and url of every car being sold in a state
DROP PROCEDURE IF EXISTS getListingsAndModelsForState //

CREATE PROCEDURE getListingsAndModelsForState (IN in_state VARCHAR(30))
BEGIN
SELECT model, url
FROM Listing AS L JOIN Vehicle as V
        ON L.CarID = V.id
        WHERE state_ = in_state;
END; //

-- Get the price, make, and model of every manufacturer's most CO2 emmitting vehicle
--todo: format prices to two decimal places, add units for CO2
DROP PROCEDURE IF EXISTS getMaxCO2VehicleForManufacturers //

CREATE PROCEDURE getMaxCO2VehicleForManufacturers ()
BEGIN

SELECT make, model, price, tailCO2
FROM(
        SELECT MAX(tailpipeCO2) as tailCO2, AVG(price) as price, V.make, V.model
        FROM Listing as L JOIN Vehicle as V JOIN Efficiency_Stats as E
        ON L.CarID = V.id AND V.model = E.model
        GROUP BY V.model
        ORDER BY tailCO2
        ) u;
END; //

-- Get the average combined mpg of every car listed grouped by state
DROP PROCEDURE IF EXISTS getAverageCombinedMPGForState //

CREATE PROCEDURE getAverageCombinedMPGForState (IN in_state VARCHAR(30))
BEGIN
SELECT avgMPG
FROM(
        SELECT state_, AVG(combinedMPG) as avgMPG
        FROM Listing as L JOIN Vehicle as V JOIN Efficiency_Stats as E
                ON L.CarID = V.id AND V.model = E.model
        GROUP BY state_
        ) u
WHERE state_ = in_state;
END; //

-- Get the average price of all vehicles of a certain make
DROP PROCEDURE IF EXISTS getAveragePriceForMake //

CREATE PROCEDURE getAveragePriceForMake (IN in_make VARCHAR(20))
BEGIN
SELECT make, AVG(price) as average_price
FROM Listing JOIN Vehicle
        ON CarID = id
        WHERE make = in_make
        GROUP BY make;
END; //

-- Find the average age of every car listed that uses premium fuel
DROP PROCEDURE IF EXISTS getAverageAgeForCarsBasedOnFuel //

CREATE PROCEDURE getAverageAgeForCarsBasedOnFuel (IN in_fuelType VARCHAR(15))
BEGIN
SELECT fuelType AS Fuel_Type, (2021 - CAST(AVG(V.year_) AS int)) as Average_Age
FROM Listing as L JOIN Vehicle as V JOIN Efficiency_Stats as E
ON L.CarID = V.id AND V.model = E.model
WHERE fuelType = in_fuelType;
END; //

-- Get the minimum wage of every state with listings and the average price of the cars listed in that state. List the states too
DROP PROCEDURE IF EXISTS getAllStatesMinWagesAndAvgCarPrice //

CREATE PROCEDURE getAllStatesMinWagesAndAvgCarPrice ()
BEGIN
SELECT L.state_ AS state_name, effMinWage, AVG(price) as avg_price
FROM Listing as L JOIN Region as R
ON L.state_ = R.state_
GROUP BY L.state_
ORDER BY effMinWage DESC;
END; //


-- Get the state with the most japanese cars listed. For that state, count the number of counties in the database for which Joe Biden recieved the most votes in the 2020 election
DROP PROCEDURE IF EXISTS getJapaneseCarsAndBidenCounties //

CREATE PROCEDURE getJapaneseCarsAndBidenCounties ()
BEGIN
SELECT cd as blue_counties
FROM(
        SELECT MAX(cx), cd
        FROM (
                SELECT L.state_, COUNT(L.state_) as cx, cd -- L.state_, (COUNT(make = 'toyota') + COUNT(make = 'infiniti') + COUNT(make = 'honda') + COUNT(make = 'nissan')) as max_, cd
                FROM Listing as L JOIN Vehicle as V JOIN (
                        SELECT state_, COUNT(candidate = 'Joe Biden') as cd
                        FROM Affiliation
                        GROUP BY state_
                        ) u
                ON V.id = L.CarID AND u.state_ = L.state_
                WHERE (make = 'toyota' OR make = 'infiniti' OR make = 'honda' OR make = 'nissan')
                GROUP BY L.state_
                ) n
        ) x;
END; //

-- List the counties in the database for which which a chevy is listed in the same state
DROP PROCEDURE IF EXISTS getCountiesWithChevies //

CREATE PROCEDURE getCountiesWithChevies()
BEGIN
SELECT A.state_ AS state_, county
FROM Listing as L JOIN Vehicle as V JOIN Affiliation as A
        ON V.id = L.CarID AND A.state_ = L.state_
WHERE make = 'chevrolet';
END; //

-- List the effective minimum wage of every state and the presidential candidate who recieved the most votes by county in that state
DROP PROCEDURE IF EXISTS getWages //

CREATE PROCEDURE getWages()
BEGIN
SELECT A.state_, effMinWage, candidate
FROM Affiliation as A JOIN Region as R
        ON A.state_ = R.state_
GROUP BY state_;
END; //

-- List the average annual fuel cost grouped by fuel type   (bar graph)
DROP PROCEDURE IF EXISTS getFuelCost //

CREATE PROCEDURE getFuelCost()
BEGIN
SELECT fuelType, AVG(annualFuelCost)
FROM Efficiency_Stats
GROUP BY fuelType;
END; //

-- Find each year's average listing price  (line graph)
DROP PROCEDURE IF EXISTS getAvgListingPrice //

CREATE PROCEDURE getAvgListingPrice()
BEGIN
SELECT year_, AVG(price)
FROM Listing as L JOIN Vehicle as V
        ON V.id = L.Carid
GROUP BY(year_);
END; //

-- Find the most expensive car listed. Get it's make, model, year, and listing url
DROP PROCEDURE IF EXISTS getMostExpensive //

CREATE PROCEDURE getMostExpensive()
BEGIN
SELECT make, model, year_, price, url
FROM Vehicle JOIN
        (SELECT CarID, MAX(price) AS price, url
        FROM Listing) u
        ON CarID = id;
END; //

-- Find the least expensive car listed with a price above 0. Find how many hours of work it would take to buy it according to the listing state's minimum wage.
DROP PROCEDURE IF EXISTS getHours //

CREATE PROCEDURE getHours (IN in_state VARCHAR(30))
BEGIN
SELECT mp / effMinWage -- as Hours_to_buy
FROM Region JOIN
        (SELECT state_, MIN(price) as mp
        FROM Listing
        WHERE price > 0
        GROUP BY state_) u
        ON u.state_ = Region.state_
	WHERE Region.state_ = in_state;
END; //

-- Get the make and model of the most popular vehicle listed   
DROP PROCEDURE IF EXISTS getMostPopular //

CREATE PROCEDURE getMostPopular()
BEGIN
SELECT make, model
FROM Vehicle
GROUP BY make, model
HAVING COUNT(*) = (SELECT MAX(c)
                   FROM (SELECT COUNT(*) AS c 
                         FROM Listing AS L JOIN Vehicle as V
                                ON L.CarID = V.ID
                         GROUP BY make, model) as temp1);
END; //

-- Get the average highway mpg of the cars listed in every state that has a minimum wage above $10. List the make and model of the car as well as their listing url
DROP PROCEDURE IF EXISTS getAverageHighwayMPGForMinWage // 

CREATE PROCEDURE getAverageHighwayMPGForMinWage()
BEGIN
SELECT V.make AS make, V.model AS model, url, AVG(highwayMPG) AS averageHighwayMPG
FROM Vehicle as V JOIN Listing as L JOIN Region as R JOIN Efficiency_Stats as E
ON V.id = L.CarID AND L.state_ = R.state_ AND V.model = E.model
WHERE effMinWage > 10
GROUP BY V.model;
END; //

DELIMITER ;