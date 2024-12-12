create database hospital_management;

use hospital_management;

-- Tạo bảng Patients
CREATE TABLE Patients (
    PatientID INT AUTO_INCREMENT PRIMARY KEY,
    FullName VARCHAR(255) NOT NULL,
    DateOfBirth DATE NOT NULL,
    Gender ENUM('Male', 'Female', 'Other') NOT NULL,
    Address TEXT NOT NULL,
    PhoneNumber VARCHAR(15),
    Email VARCHAR(255)
);

-- Tạo bảng Doctors
CREATE TABLE Doctors (
    DoctorID INT AUTO_INCREMENT PRIMARY KEY,
    FullName VARCHAR(255) NOT NULL,
    Specialization VARCHAR(100) NOT NULL,
    PhoneNumber VARCHAR(15),
    Email VARCHAR(255)
);

-- Tạo bảng Appointments
CREATE TABLE Appointments (
    AppointmentID INT AUTO_INCREMENT PRIMARY KEY,
    PatientID INT NOT NULL,
    DoctorID INT NOT NULL,
    AppointmentDate DATETIME NOT NULL,
    Status ENUM('Scheduled', 'Completed', 'Cancelled') NOT NULL,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

-- Tạo bảng MedicalRecords
CREATE TABLE MedicalRecords (
    RecordID INT AUTO_INCREMENT PRIMARY KEY,
    PatientID INT NOT NULL,
    DoctorID INT NOT NULL,
    Diagnosis TEXT NOT NULL,
    Treatment TEXT NOT NULL,
    Date DATE NOT NULL,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

-- Tạo bảng Medications
CREATE TABLE Medications (
    MedicationID INT AUTO_INCREMENT PRIMARY KEY,
    MedicationName VARCHAR(255) NOT NULL,
    Description TEXT,
    Price DECIMAL(10, 2) NOT NULL
);

-- Tạo bảng Prescriptions
CREATE TABLE Prescriptions (
    PrescriptionID INT AUTO_INCREMENT PRIMARY KEY,
    RecordID INT NOT NULL,
    MedicationID INT NOT NULL,
    Dosage VARCHAR(100) NOT NULL,
    Frequency VARCHAR(100) NOT NULL,
    FOREIGN KEY (RecordID) REFERENCES MedicalRecords(RecordID),
    FOREIGN KEY (MedicationID) REFERENCES Medications(MedicationID)
);

-- Chèn dữ liệu vào bảng Patients
INSERT INTO Patients (FullName, DateOfBirth, Gender, Address, PhoneNumber, Email)
VALUES
('Nguyen Van A', '1990-05-15', 'Male', '123 Le Loi, Ho Chi Minh City', '0901234567', 'nguyenvana@example.com'),
('Tran Thi B', '1985-08-20', 'Female', '456 Tran Hung Dao, Hanoi', '0912345678', 'tranthib@example.com'),
('Le Minh C', '1992-03-10', 'Male', '789 Nguyen Trai, Da Nang', '0934567890', 'leminhc@example.com'),
('Pham Hong D', '2000-12-05', 'Female', '321 Hai Ba Trung, Hue', '0945678901', 'phamhongd@example.com'),
('Hoang Thi E', '1978-07-25', 'Female', '567 Ly Thuong Kiet, Can Tho', '0956789012', 'hoangthie@example.com');

-- Chèn dữ liệu vào bảng Doctors
INSERT INTO Doctors (FullName, Specialization, PhoneNumber, Email)
VALUES
('Dr. Nguyen Van Tuan', 'Cardiology', '0901122334', 'tuan.cardiology@example.com'),
('Dr. Tran Thi Hoa', 'Dermatology', '0902233445', 'hoa.dermatology@example.com'),
('Dr. Le Thanh Phong', 'Neurology', '0903344556', 'phong.neurology@example.com'),
('Dr. Pham Van Khoa', 'Orthopedics', '0904455667', 'khoa.orthopedics@example.com'),
('Dr. Hoang Minh Anh', 'Pediatrics', '0905566778', 'anh.pediatrics@example.com');

-- Chèn dữ liệu vào bảng Appointments
INSERT INTO Appointments (PatientID, DoctorID, AppointmentDate, Status)
VALUES
(1, 1, '2024-12-15 09:00:00', 'Scheduled'),
(2, 2, '2024-12-16 10:00:00', 'Completed'),
(3, 3, '2024-12-17 11:00:00', 'Cancelled'),
(4, 4, '2024-12-18 14:00:00', 'Scheduled'),
(5, 5, '2024-12-19 15:00:00', 'Completed');

-- Chèn dữ liệu vào bảng MedicalRecords
INSERT INTO MedicalRecords (PatientID, DoctorID, Diagnosis, Treatment, Date)
VALUES
(1, 1, 'Hypertension', 'Medication and lifestyle changes', '2024-12-15'),
(2, 2, 'Acne', 'Topical creams and antibiotics', '2024-12-16'),
(3, 3, 'Migraine', 'Pain relievers and relaxation therapy', '2024-12-17'),
(4, 4, 'Fractured arm', 'Casting and physiotherapy', '2024-12-18'),
(5, 5, 'Flu', 'Antiviral medication and rest', '2024-12-19');

-- Chèn dữ liệu vào bảng Medications
INSERT INTO Medications (MedicationName, Description, Price)
VALUES
('Amlodipine', 'Used to treat high blood pressure.', 150.00),
('Clindamycin', 'Antibiotic for acne treatment.', 250.00),
('Ibuprofen', 'Pain reliever and anti-inflammatory.', 50.00),
('Paracetamol', 'Common pain reliever.', 30.00),
('Oseltamivir', 'Antiviral medication for flu.', 300.00);

-- Chèn dữ liệu vào bảng Prescriptions
INSERT INTO Prescriptions (RecordID, MedicationID, Dosage, Frequency)
VALUES
(1, 1, '5mg', 'Once daily'),
(2, 2, '1 tablet', 'Twice daily'),
(3, 3, '400mg', 'As needed'),
(4, 4, '500mg', 'Three times daily'),
(5, 5, '75mg', 'Twice daily');


