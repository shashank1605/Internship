CREATE DATABASE stringfunctions;
USE stringfunctions;

CREATE TABLE example_data (
    id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    mixed_case_string VARCHAR(100),
    padded_string VARCHAR(100)
);

INSERT INTO example_data (id, first_name, last_name, mixed_case_string, padded_string) VALUES
(1, 'sai', 'Shashank', 'ThiS iS A MiXed CAse StrIng!', '    doing internship   '),
(2, 'krishna', 'koushik', 'HeLLo WoRLD', '    studying programming    '),
(3, 'jai', 'adithya', 'TeSTinG StRIng FuNctIOns', '    learning something    ');

SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM example_data;

SELECT LOWER(mixed_case_string) AS lower_string
FROM example_data;

SELECT SUBSTRING('Hello, All!', 5, 6) AS substring;

SELECT LPAD('Hello', 10, '#') AS padded_string_left;

SELECT RPAD('Hello', 10, '#') AS padded_string_right;

SELECT TRIM('    Hello, world!    ') AS trimmed_string;
