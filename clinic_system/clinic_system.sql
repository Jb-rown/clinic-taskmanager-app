-- Clinic Booking System SQL schema
 CREATE DATABASE clinic_db;

 USE clinic_db;

-- PatientS Tables
 CREATE TABLE patients (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT,
    dob DATE,
    gender ENUM('Male', 'Female', 'Other'),
    contact VARCHAR(50) UNIQUE,
    email VARCHAR(100)
 );

 -- Doctors Table
 CREATE TABLE doctors (
    doctor_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    specialization VARCHAR(50),
    contact VARCHAR(50) UNIQUE,
    email VARCHAR(100),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
 );


-- Appointments Table
CREATE TABLE Appointments (
    Appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    appointment_time TIME,
    reason TEXt,
    status VARCHAR(20),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)

);


-- Prescriptions Table
CREATE TABLE prescriptions (
    prescription_id INT AUTO_INCREMENT PRIMARY KEY,
    Appointment_id INT,
    medication TEXT NOT NULL,
    dosage TEXT NOT NULL,
    instructions TEXT,
    FOREIGN KEY (appointment_id) REFERENCES appointments(appointment_id)

);

-- Departments table
CREATE TABLE departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);


-- Sample Data

-- Patients
INSERT INTO patients (name, dob, gender, phone, email) VALUES
('John Doe', '1985-07-12', 'Male', '0712345678', 'johndoe@example.com'),
('Jane Smith', '1992-11-05', 'Female', '0723456789', 'janesmith@example.com');

-- departments
INSERT INTO departments (name) VALUES
('Cardiology'),
('Pediatrics'),
('Orthopedics');


--  Doctors
INSERT INTO doctors (name, specialization, phone, email, department_id) VALUES
('Dr. Patel', 'Cardiologist', '0700112233', 'patel@example.com', 1),
('Dr. Wangari', 'Pediatrician', '0700987654', 'wangari@example.com', 2);

-- appointments
INSERT INTO appointments (patient_id, doctor_id, appointment_date, appointment_time, reason, status) VALUES
(1, 1, '2025-04-18', '10:00:00', 'Skin rash', 'Scheduled' ),
(2, 2, '2025-04-20', '14:00:00', 'Chest pain', 'Completed');

-- Prescriptions
INSERT INTO prescriptions (appointment_id, medication, dosage, instructions) VALUES
(2, 'Paracetamol', '500mg', 'Take twice daily after meals');
