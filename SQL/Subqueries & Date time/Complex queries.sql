CREATE DATABASE Healthcare;
USE Healthcare;

CREATE TABLE patients (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    age INT,
    gender VARCHAR(10)
);

CREATE TABLE doctors (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    specialty VARCHAR(100)
);

CREATE TABLE appointments (
    appointment_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    fee DECIMAL(10, 2),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

INSERT INTO patients (name, age, gender) VALUES
('Ananya', 25, 'Female'),
('Raghav', 40, 'Male'),
('Ravi', 55, 'Male'),
('Meena', 60, 'Female');

INSERT INTO doctors (name, specialty) VALUES
('Dr. Sharma', 'Pediatrics'),
('Dr. Verma', 'Cardiology'),
('Dr. Iyer', 'Neurology'),
('Dr. Gupta', 'Dermatology');

INSERT INTO appointments (patient_id, doctor_id, appointment_date, fee) VALUES
(1, 1, '2024-06-01', 100.00),
(2, 2, '2024-06-03', 150.00),
(3, 3, '2024-06-05', 200.00),
(4, 1, '2024-06-07', 100.00),
(1, 3, '2024-06-10', 200.00),
(2, 4, '2024-06-12', 120.00);

-- SELECT keyword
SELECT 
    p.name,
    (SELECT SUM(a.fee) 
     FROM appointments a 
     WHERE a.patient_id = p.patient_id) AS total_fee
FROM patients p;

-- FROM keyword
SELECT 
    d.name,
    avg_fees.average_fee
FROM doctors d
JOIN (
    SELECT 
        doctor_id, 
        AVG(fee) AS average_fee
    FROM appointments
    GROUP BY doctor_id
) avg_fees ON d.doctor_id = avg_fees.doctor_id;

--- WHERE keyword
SELECT 
    p.name
FROM patients p
WHERE (
    SELECT COUNT(*) 
    FROM appointments a 
    WHERE a.patient_id = p.patient_id
) > 1;

-- EXISTS keyword
SELECT 
    d.name
FROM doctors d
WHERE EXISTS (
    SELECT 1
    FROM appointments a
    JOIN patients p ON a.patient_id = p.patient_id
    WHERE a.doctor_id = d.doctor_id AND p.age > 40
);
