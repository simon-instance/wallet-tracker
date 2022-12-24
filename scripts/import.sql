-- SELECT @file

SET @out = CONCAT('LOAD DATA INFILE ''', @file, '''
INTO TABLE Wallet 
LINES TERMINATED BY ''\n'' 
(address)');


SELECT @out INTO OUTFILE '/scripts/outfile.sql';

SOURCE outfile.sql;
-- LOAD DATA INFILE @file
-- INTO TABLE Wallet
-- LINES TERMINATED BY '\n'
-- (address)