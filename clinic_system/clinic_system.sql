-- Clinic Booking System SQL schema
 CREATE DATABASE clinic_db;

 USE clinic_db;

-- PatientS Tables
 CREATE TABLE patients (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT,
    gender ENUM('Male', 'Female', 'Other'),
    contact VARCHAR(50) UNIQUE
 );

 -- Doctors Table
 CREATE TABLE doctors (
    doctor_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    specialization VARCHAR(50),
    contact VARCHAR(50) UNIQUE
 );


-- Appointments Table
CREATE TABLE Appointments (
    Appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    appointment_time TIME,
    reason TEXt,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)

);


-- Prescriptions Table
CREATE TABLE prescriptions (
    prescription_id INT AUTO_INCREMENT PRIMARY KEY,
    Appointment_id INT,
    medication TEXT NOT NULL,
    dosage TEXT NOT NULL,
    FOREIGN KEY (appointment_id) REFERENCES appointments(appointment_id)

);

-- Sample Data

-- Patients
INSERT INTO patients (name, age, gender, contact) VALUES
('John Brown', 22, 'Male', '0700123456'),
('Daizy Treezer', 20, 'Female', '0712345678');


--  Doctors
INSERT INTO doctors (name, specialization, contact) VALUES
('Dr. Mike Hassan', 'Dermatology', '0788123123'),
('Dr. Linda Kamau', 'Cardiology', '0799988776');

-- appointments
INSERT INTO appointments (patient_id, doctor_id, appointment_date, appointment_time, reason) VALUES
(1, 1, '2025-04-18', '10:00:00', 'Skin rash'),
(2, 2, '2025-04-20', '14:00:00', 'Chest pain');

-- Prescriptions
INSERT INTO prescriptions (appointment_id, medication, dosage) VALUES
(1, 'Hydrocortisone cream', 'Apply twice a day'),
(2, 'Aspirin', '75mg once daily');