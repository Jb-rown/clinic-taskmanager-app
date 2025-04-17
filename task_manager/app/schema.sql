-- This file contains the SQL commands to create the database and tables for the task manager application.
CREATE DATABASE task_db;

USE task_db;

-- users table
-- This table stores the user information.
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE
);

-- tasks table
-- This table stores the tasks created by users.
CREATE TABLE tasks (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    title VARCHAR(100),
    description TEXT,
    status VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES users(id)
);