CREATE DATABASE OSBBDB;

USE OSBBDB;

CREATE TABLE Buildings (
    building_id INT PRIMARY KEY AUTO_INCREMENT,
    building_number INT NOT NULL,
    address VARCHAR(255) NOT NULL
);

CREATE TABLE Apartments (
    apartment_id INT PRIMARY KEY AUTO_INCREMENT,
    building_id INT,
    apartment_number INT NOT NULL,
    area DECIMAL(10, 2) NOT NULL,
    CONSTRAINT fk_building_id FOREIGN KEY (building_id) REFERENCES Buildings(building_id)
);

CREATE TABLE Roles (
    role_id INT PRIMARY KEY AUTO_INCREMENT,
    role_name VARCHAR(50) NOT NULL
);

CREATE TABLE OSBBMembers (
    member_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(255) NOT NULL,
    roles_list VARCHAR(255),
    email VARCHAR(255)
    CONSTRAINT fk_roles_list FOREIGN KEY (roles_list) REFERENCES Roles(role_id)
);

CREATE TABLE Residents (
    resident_id INT PRIMARY KEY AUTO_INCREMENT,
    member_id INT,
    car_access BOOLEAN NOT NULL DEFAULT 0,
    CONSTRAINT fk_member_id FOREIGN KEY (member_id) REFERENCES OSBBMembers(member_id)
);

CREATE TABLE Ownership (
    ownership_id INT PRIMARY KEY AUTO_INCREMENT,
    member_id INT,
    apartment_id INT,
    ownership_start DATE NOT NULL,
    ownership_end DATE,
    CONSTRAINT fk_member_id_ownership FOREIGN KEY (member_id) REFERENCES OSBBMembers(member_id),
    CONSTRAINT fk_apartment_id FOREIGN KEY (apartment_id) REFERENCES Apartments(apartment_id)
);

CREATE TABLE Residence (
    residence_id INT PRIMARY KEY AUTO_INCREMENT,
    resident_id INT,
    apartment_id INT,
    move_in_date DATE NOT NULL,
    move_out_date DATE,
    CONSTRAINT fk_resident_id FOREIGN KEY (resident_id) REFERENCES Residents(resident_id),
    CONSTRAINT fk_apartment_id_residence FOREIGN KEY (apartment_id) REFERENCES Apartments(apartment_id)
);