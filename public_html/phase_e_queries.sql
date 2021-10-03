-- Get the model and url of every car being sold in california
SELECT model, url
FROM Listing AS L JOIN Vehicle as V
        ON L.CarID = V.id
        WHERE state_ = 'California';
        
-- Get the average price of all ford vehicles
SELECT AVG(price) as average_price
FROM Listing JOIN Vehicle
        ON CarID = id
        WHERE make = 'ford'
        GROUP BY make;

-- Get the price, make, and model of every manufacturer's most CO2 emmitting vehicle
SELECT price, make, model
FROM(
        SELECT MAX(tailpipeCO2), AVG(price) as price, V.make, V.model
        FROM Listing as L JOIN Vehicle as V JOIN Efficiency_Stats as E
        ON L.CarID = V.id AND V.model = E.model
        GROUP BY V.model
        ) u;
        
-- Get the average combined mpg of every car listed grouped by state
SELECT state_, AVG(combinedMPG)
FROM Listing as L JOIN Vehicle as V JOIN Efficiency_Stats as E
ON L.CarID = V.id AND V.model = E.model
GROUP BY state_;

-- Find the average age of every car listed that uses premium fuel
SELECT (2021 - CAST(AVG(V.year_) AS int)) as Average_Age
FROM Listing as L JOIN Vehicle as V JOIN Efficiency_Stats as E
ON L.CarID = V.id AND V.model = E.model
WHERE fuelType = 'Premium';

-- Get the minimum wage of every state with listings and the average price of the cars listed in that state. List the states too
SELECT L.state_, effMinWage, AVG(price)
FROM Listing as L JOIN Region as R
ON L.state_ = R.state_
GROUP BY L.state_;

-- Get the average highway mpg of the cars listed in every state that has a minimum wage above $10. List the make and model of the car as well as their listing url
SELECT V.make, V.model, url, AVG(highwayMPG)
FROM Vehicle as V JOIN Listing as L JOIN Region as R JOIN Efficiency_Stats as E
ON V.id = L.CarID AND L.state_ = R.state_ AND V.model = E.model
WHERE effMinWage > 10
GROUP BY V.model;

-- Get the state with the most japanese cars listed. For that state, count the number of counties in the database for which Joe Biden recieved the most votes in the 2020 election
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
        
-- List the counties in the database for which which a chevy is listed in the same state
SELECT county
FROM Listing as L JOIN Vehicle as V JOIN Affiliation as A
        ON V.id = L.CarID AND A.state_ = L.state_
WHERE make = 'chevrolet';

-- List the effective minimum wage of every state and the presidential candidate who recieved the most votes by county in that state
SELECT A.state_, effMinWage, candidate
FROM Affiliation as A JOIN Region as R
        ON A.state_ = R.state_
GROUP BY state_;

-- List the average annual fuel cost grouped by fuel type   (bar graph)
SELECT fuelType, AVG(annualFuelCost)
FROM Efficiency_Stats
GROUP BY fuelType;

-- Find each year's average listing price  (line graph)
SELECT year_, AVG(price)
FROM Listing as L JOIN Vehicle as V
        ON V.id = L.Carid
GROUP BY(year_);

-- Find the most expensive car listed. Get it's make, model, year, and listing url
SELECT make, model, year_, url
FROM Vehicle JOIN
        (SELECT CarID, MAX(price), url
        FROM Listing) u
        ON CarID = id;

-- Find the least expensive car listed with a price above 0. Find how many hours of work it would take to buy it according to the listing state's minimum wage.
SELECT mp / effMinWage -- as Hours_to_buy
FROM Region JOIN
        (SELECT state_, MIN(price) as mp
        FROM Listing
        WHERE price > 0) u
        ON u.state_ = Region.state_;

-- Get the make and model of the most popular vehicle listed   
SELECT make, model
FROM Vehicle
GROUP BY make, model
HAVING COUNT(*) = (SELECT MAX(c)
                   FROM (SELECT COUNT(*) AS c 
                         FROM Listing AS L JOIN Vehicle as V
                                ON L.CarID = V.ID
                         GROUP BY make, model) as temp1);