CREATE DATABASE datetime;
USE datetime;

CREATE TABLE dates (
    id INT AUTO_INCREMENT PRIMARY KEY,
    event_date DATETIME
);

INSERT INTO dates (event_date) VALUES
('2024-06-18 7:19:50'),
('2024-06-19 15:45:00'),
(NOW());

USE datetime;
SELECT CURRENT_DATE() AS current_date;
SELECT SYSDATE() AS current_datetime;

SELECT DATEDIFF('2024-06-19', '2024-06-18') AS days_difference;

SELECT LAST_DAY('2024-05-01') AS last_day_of_month;
SELECT ADDDATE(CURRENT_DATE(), INTERVAL 3 MONTH) AS new_date;

SELECT TIME(event_date) AS time_component FROM dates;
