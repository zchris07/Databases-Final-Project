SET FOREIGN_KEY_CHECKS=OFF;
CREATE TABLE Vehicle(
        vin VARCHAR(20),
        ID VARCHAR(20),
        make VARCHAR(20),
        model VARCHAR(20),
        year_ VARCHAR(20),
        condition_ VARCHAR(20),
        PRIMARY KEY(ID),
        FOREIGN KEY (ID) REFERENCES Listing (CarID)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE Listing(
        CarID VARCHAR(20),
        state_ VARCHAR(20),
        price INT(10),
        url VARCHAR(50),
        PRIMARY KEY(CarID),
        FOREIGN KEY (CarID) REFERENCES Vehicle (ID)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
        
CREATE TABLE Efficiency_Stats(
        make VARCHAR(20),
        model VARCHAR(20),
        year_ VARCHAR(20),
        tailpipeCO2 INT(100),
        fuelType VARCHAR(100),
        combinedMPG INT(5),
        highwayMPG INT(5),
        cityMPG INT(5),
        annualFuelCost INT(5),
        PRIMARY KEY(make, model, year_)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8; 
       
CREATE TABLE Region(
        state_ VARCHAR(25),
        effMinWage DECIMAL(5, 2),
        PRIMARY KEY(state_)
        );
        
CREATE TABLE Affiliation(
        state_ VARCHAR(25),
        county VARCHAR(25),
        candidate VARCHAR(20)
        );
        
        
LOAD DATA LOCAL INFILE 'C:/Users/zchri/Downloads/vehicle-small.csv' INTO TABLE Vehicle
COLUMNS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@dummy, ID, year_, make, model, condition_, vin);

LOAD DATA LOCAL INFILE 'C:/Users/zchri/Downloads/listing-small.csv' INTO TABLE Listing
COLUMNS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@dummy, CarID, url, state_, price);

LOAD DATA LOCAL INFILE 'C:/Users/zchri/Downloads/efficiency_stats-small.csv' INTO TABLE Efficiency_Stats
COLUMNS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@dummy, year_, make, model, fuelType, cityMPG, highwayMPG, combinedMPG, annualFuelCost, tailpipeCO2);

LOAD DATA LOCAL INFILE 'C:/Users/zchri/Downloads/region-small.csv' INTO TABLE Region
COLUMNS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@dummy, state_, effMinWage);

LOAD DATA LOCAL INFILE 'C:/Users/zchri/Downloads/affiliation-small.csv' INTO TABLE Affiliation
COLUMNS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@dummy, state_, county, candidate, @dummy);