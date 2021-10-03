-- czou8 stusa2
SET FOREIGN_KEY_CHECKS=OFF;
DROP TABLE IF EXISTS Vehicle;
CREATE TABLE Vehicle(
        vin VARCHAR(20),
        ID BIGINT(20),
        make VARCHAR(20),
        model VARCHAR(40),
        year_ VARCHAR(20),
        condition_ VARCHAR(20),
        PRIMARY KEY(ID)
        ) Engine=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS Listing;
CREATE TABLE Listing(
        CarID BIGINT(20),
        region VARCHAR(40),
        price DECIMAL(10),
        url VARCHAR(100),
        PRIMARY KEY(CarID),
        FOREIGN KEY (CarID) REFERENCES Vehicle (ID)
        ON DELETE CASCADE
        ) Engine=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS Efficiency_Stats;
CREATE TABLE Efficiency_Stats(
        make VARCHAR(20),
        model VARCHAR(40),
        year_ VARCHAR(20),
        tailpipeCO2 DECIMAL(10, 2),
        fuelType VARCHAR(100),
        combinedMPG INT(5),
        highwayMPG INT(5),
        cityMPG INT(5),
        annualFuelCost INT(5),
        PRIMARY KEY(make, model, year_)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8; 

DROP TABLE IF EXISTS Region;
CREATE TABLE Region(
        state_ VARCHAR(25),
        effMinWage DECIMAL(5, 2),
        PRIMARY KEY(state_)
        );
DROP TABLE IF EXISTS Affiliation;
CREATE TABLE Affiliation(
        state_ VARCHAR(25),
        county VARCHAR(25),
        candidate VARCHAR(20)
        );
        
        
LOAD DATA LOCAL INFILE 'C:/Users/stefa/Documents/tefano/jhu/databases/final project/database/vehicle1.csv' INTO TABLE Vehicle
COLUMNS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@dummy, vin, make, model, year_, id, condition_);

LOAD DATA LOCAL INFILE 'C:/Users/stefa/Documents/tefano/jhu/databases/final project/database/listing1.csv' INTO TABLE Listing
COLUMNS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@dummy, url, region, price, carid);

LOAD DATA LOCAL INFILE 'C:/Users/stefa/Documents/tefano/jhu/databases/final project/database/efficiency_stats.csv' INTO TABLE Efficiency_Stats
COLUMNS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@dummy, year_, make, model, fuelType, cityMPG, highwayMPG, combinedMPG, annualFuelCost, tailpipeCO2);

LOAD DATA LOCAL INFILE 'C:/Users/stefa/Documents/tefano/jhu/databases/final project/database/region.csv' INTO TABLE Region
COLUMNS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@dummy, state_, effMinWage);

LOAD DATA LOCAL INFILE 'C:/Users/stefa/Documents/tefano/jhu/databases/final project/database/affiliation.csv' INTO TABLE Affiliation
COLUMNS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@dummy, state_, county, candidate, @dummy);

INSERT INTO Vehicle (vin, ID, make, model, year_, condition_)
VALUES ('QWERTYASDF', 123456, 'ford', 'focus', 1997, 'awesome')
ON DUPLICATE KEY UPDATE vin = 'ZXCVBNM', make = 'toyota', model = 'corolla'

DELETE FROM Vehicle WHERE id = 123456