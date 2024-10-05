CREATE DATABASE ClinicManagement;
USE ClinicManagement;

-- Bảng Doctor (Bác sỹ)
CREATE TABLE Doctor (
                        doctor_id INT AUTO_INCREMENT PRIMARY KEY,
                        name VARCHAR(255) NOT NULL,
                        id_card VARCHAR(50) NOT NULL UNIQUE,
                        birthdate DATE NOT NULL,
                        address VARCHAR(255) NOT NULL,
                        doctor_rank VARCHAR(50),  -- Đổi tên trường để tránh từ khóa
                        experience_years INT,
                        qualification VARCHAR(255),
                        specialization VARCHAR(255)
);


-- Bảng Nurse (Y tá)
CREATE TABLE Nurse (
                       nurse_id INT AUTO_INCREMENT PRIMARY KEY,
                       name VARCHAR(255) NOT NULL,
                       id_card VARCHAR(50) NOT NULL UNIQUE,
                       birthdate DATE NOT NULL,
                       address VARCHAR(255) NOT NULL,
                       experience_years INT,
                       phone_number VARCHAR(20),
                       qualification VARCHAR(255)
);

-- Bảng Patient (Bệnh nhân)
CREATE TABLE Patient (
                         patient_id INT AUTO_INCREMENT PRIMARY KEY,
                         name VARCHAR(255) NOT NULL,
                         id_card VARCHAR(50) NOT NULL UNIQUE,
                         birthdate DATE NOT NULL,
                         address VARCHAR(255) NOT NULL,
                         phone_number VARCHAR(20)
);

-- Bảng Visit (Lần khám)
CREATE TABLE Visit (
                       visit_id INT AUTO_INCREMENT PRIMARY KEY,
                       patient_id INT NOT NULL,
                       doctor_id INT NOT NULL,
                       entry_date DATE NOT NULL,
                       exit_date DATE,
                       disease VARCHAR(255) NOT NULL,
                       treatment_cost DECIMAL(10, 2) NOT NULL,
                       FOREIGN KEY (patient_id) REFERENCES Patient(patient_id),
                       FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id)
);

-- Bảng Prescription (Đơn thuốc)
CREATE TABLE Prescription (
                              prescription_id INT AUTO_INCREMENT PRIMARY KEY,
                              visit_id INT NOT NULL,
                              medicine_name VARCHAR(255) NOT NULL,
                              quantity INT NOT NULL,
                              unit_price DECIMAL(10, 2) NOT NULL,
                              FOREIGN KEY (visit_id) REFERENCES Visit(visit_id)
);

-- Bảng Nurse_Assistance (Chăm sóc của y tá)
CREATE TABLE Nurse_Assistance (
                                  nurse_id INT NOT NULL,
                                  visit_id INT NOT NULL,
                                  assistance_date DATE NOT NULL,
                                  task VARCHAR(255),
                                  FOREIGN KEY (nurse_id) REFERENCES Nurse(nurse_id),
                                  FOREIGN KEY (visit_id) REFERENCES Visit(visit_id),
                                  PRIMARY KEY (nurse_id, visit_id, assistance_date)
);
USE ClinicManagement;
INSERT INTO Doctor (name, id_card, birthdate, address, doctor_rank, experience_years, qualification, specialization)
VALUES
    ('Nguyen Van A', '123456789', '1975-03-10', 'Ha Noi', 'Chuyen Khoa II', 15, 'Dai Hoc Y Ha Noi', 'Noi Khoa'),
    ('Le Thi B', '987654321', '1980-07-25', 'Hai Phong', 'Chuyen Khoa I', 10, 'Dai Hoc Y Hai Phong', 'Ngoai Khoa');
INSERT INTO Nurse (name, id_card, birthdate, address, experience_years, phone_number, qualification)
VALUES
    ('Tran Thi C', '456123789', '1985-11-12', 'Da Nang', 8, '0912345678', 'Cao Dang Dieu Duong'),
    ('Pham Van D', '321654987', '1990-05-05', 'Can Tho', 5, '0908765432', 'Cao Dang Dieu Duong');
INSERT INTO Patient (name, id_card, birthdate, address, phone_number)
VALUES
    ('Vo Thi E', '789456123', '1992-09-20', 'Quang Nam', '0981234567'),
    ('Hoang Van F', '654789321', '1988-12-12', 'Nha Trang', '0978765432');
INSERT INTO Visit (patient_id, doctor_id, entry_date, exit_date, disease, treatment_cost)
VALUES
    (1, 1, '2024-09-15', '2024-09-20', 'Cao huyet ap', 500000),
    (2, 2, '2024-09-10', '2024-09-12', 'Dau da day', 300000);
INSERT INTO Prescription (visit_id, medicine_name, quantity, unit_price)
VALUES
    (1, 'Thuoc ha huyet ap', 2, 150000),
    (2, 'Thuoc chua da day', 3, 100000);
INSERT INTO Nurse_Assistance (nurse_id, visit_id, assistance_date, task)
VALUES
    (1, 1, '2024-09-15', 'Cap thuoc'),
    (2, 2, '2024-09-10', 'Tiem thuoc');
-- Xem dữ liệu trong bảng Doctor
SELECT * FROM Doctor;

-- Xem dữ liệu trong bảng Nurse
SELECT * FROM Nurse;

-- Xem dữ liệu trong bảng Patient
SELECT * FROM Patient;

-- Xem dữ liệu trong bảng Visit
SELECT * FROM Visit;

-- Xem dữ liệu trong bảng Prescription
SELECT * FROM Prescription;

-- Xem dữ liệu trong bảng Nurse_Assistance
SELECT * FROM Nurse_Assistance;
