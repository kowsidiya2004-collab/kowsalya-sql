create database discount;
use discount;

CREATE TABLE shop (
    veg_id INT PRIMARY KEY,
    veg_name VARCHAR(30),
    price DECIMAL(10,2),
    discount DECIMAL(10,2)); 
    -- discount in currency (e.g., Rs.)


INSERT INTO shop(veg_id,veg_name,price,discount) VALUES
(1, 'raw mango', 100, 5),
(2, 'beetroot', 150, 7),
(3, 'beans', 170, 10),
(4, 'raddish white', 70, 8),
(5, 'cucumber', 100, 12);


DELIMITER $$

CREATE FUNCTION avg_discount()
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE avgDisc DECIMAL(10,2);
    SELECT AVG(discount) INTO avgDisc FROM shop;
    RETURN avgDisc;
END$$

DELIMITER ;

SELECT avg_discount() AS Average_Discount;
