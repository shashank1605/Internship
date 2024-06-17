CREATE DATABASE bit_wise
USE  bit_wise

CREATE TABLE binary_numbers (
    id INT PRIMARY KEY,
    binary_value1 INT,
    binary_value2 INT
);

INSERT INTO binary_numbers (id, binary_value1, binary_value2) VALUES
(1, 5, 3),
(2, 12, 10);
SELECT binary_value1, binary_value2,
       binary_value1 & binary_value2 AS bitwise_and_result
FROM binary_numbers
WHERE id = 1;

SELECT binary_value1, binary_value2,
       binary_value1 | binary_value2 AS bitwise_or_result
FROM binary_numbers
WHERE id = 1;

SELECT binary_value1, binary_value2,
       binary_value1 ^ binary_value2 AS bitwise_xor_result
FROM binary_numbers
WHERE id = 1;


