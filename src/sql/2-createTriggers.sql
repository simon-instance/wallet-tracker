CREATE TRIGGER ck_Wallet_length BEFORE INSERT ON Wallet
FOR EACH ROW BEGIN
  DECLARE @numLength INT;
  SET @numLength = (SELECT LENGTH(NEW.address));

  IF (@numLength != 42) THEN
    SIGNAL SQLSTATE '45001' SET MESSAGE_TEXT = 'An ethereum address must be 42 characters';
  END IF;
END;

CREATE TRIGGER ck_Wallet_valid BEFORE INSERT ON Wallet
FOR EACH ROW BEGIN
  DECLARE @addressBeginning VARCHAR(2);
  SET @addressBeginning = (SELECT LEFT(NEW.address, 2));

  IF(@addressBeginning != '0x') THEN
    SIGNAL SQLSTATE '45002' SET MESSAGE_TEXT = 'An ethereum address must begin with 0x';
  END IF;
END;