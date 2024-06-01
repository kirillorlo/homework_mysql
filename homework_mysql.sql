-- процедура для вывода четных чисел

DELIMITER //

CREATE PROCEDURE even_numbers(IN max_number INT)
BEGIN
  DECLARE i INT DEFAULT 1;
  DECLARE result VARCHAR(255) DEFAULT '';

  WHILE i <= max_number DO
    IF i % 2 = 0 THEN
      SET result = CONCAT(result, i, ' ');
    END IF;
    SET i = i + 1;
  END WHILE;

  SELECT TRIM(result);
END //

DELIMITER ;

CALL even_numbers(15);

-- функция для перевода числа в календарный вариант(дни, часы, секунды)

DELIMITER //

CREATE FUNCTION seconds_to_dhms(seconds INT)
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
  DECLARE days INT;
  DECLARE hours INT;
  DECLARE minutes INT;
  DECLARE seconds_result INT;

  SET days = seconds DIV 86400;
  SET hours = (seconds DIV 3600) % 24;
  SET minutes = (seconds DIV 60) % 60;
  SET seconds_result = seconds % 60;

  RETURN CONCAT(days, ' дней ', hours, ' часов ', minutes, ' минут ', seconds_result, ' секунд');
END //

DELIMITER ;

SELECT seconds_to_dhms(1234);