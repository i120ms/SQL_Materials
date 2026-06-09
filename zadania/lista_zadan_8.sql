DROP DATABASE IF EXISTS hospital;
CREATE DATABASE hospital
CHARACTER SET utf8mb4
COLLATE utf8mb4_polish_ci;

USE hospital;

CREATE TABLE patient (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    birth_date DATE
);

CREATE TABLE doctor (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    specialization VARCHAR(50)
);

CREATE TABLE test (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50)
);

CREATE TABLE examination (
    id INT PRIMARY KEY AUTO_INCREMENT,

    patient_id INT,
    doctor_id INT,
    test_id INT NOT NULL,

    exam_date DATE,

    FOREIGN KEY(patient_id)
        REFERENCES patient(id)
        ON DELETE SET NULL,

    FOREIGN KEY(doctor_id)
        REFERENCES doctor(id)
        ON DELETE SET NULL,

    FOREIGN KEY(test_id)
        REFERENCES test(id)
        ON DELETE RESTRICT
);

INSERT INTO patient(first_name,last_name,birth_date)
VALUES
('Mi','Bombo','1990-01-01'),
('Igor','Górski','1995-02-02'),
('Marek','Wiśniewski','1988-03-03'),
('Julia','Mazur','2000-04-04'),
('Adam','Kurek','1977-05-05'),
('Ola','Lis','1999-06-06');

INSERT INTO doctor(first_name,last_name,specialization)
VALUES
('Piotr','Malinowski','Kardiolog'),
('Karol','Wójcik','Neurolog'),
('Monika','Sikora','Chirurg');

INSERT INTO test(name)
VALUES
('EKG'),
('RTG'),
('Morfologia'),
('USG');
