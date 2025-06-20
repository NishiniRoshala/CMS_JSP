CREATE DATABASE IF NOT EXISTS complaint_db;
USE complaint_db;


CREATE TABLE users (
                       user_id INT AUTO_INCREMENT PRIMARY KEY,
                       username VARCHAR(50) NOT NULL UNIQUE,
                       password VARCHAR(255) NOT NULL,
                       full_name VARCHAR(100),
                       role ENUM('EMPLOYEE', 'ADMIN') NOT NULL);

CREATE TABLE complaints (
                            complaint_id INT AUTO_INCREMENT PRIMARY KEY,
                            user_id INT NOT NULL,
                            title VARCHAR(100) NOT NULL,
                            description TEXT NOT NULL,
                            status ENUM('PENDING', 'IN_PROGRESS', 'RESOLVED') DEFAULT 'PENDING',
                            created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                            updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                            FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);


ALTER TABLE complaints
    ADD COLUMN remark VARCHAR(255) DEFAULT NULL;

ALTER TABLE complaints
    MODIFY COLUMN remark VARCHAR(255) DEFAULT 'No remarks';