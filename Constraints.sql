use hospital_management;
ALTER TABLE Patients ADD CONSTRAINT Unique_PhoneNumber UNIQUE (PhoneNumber);
ALTER TABLE Medications ADD CONSTRAINT Check_MedicationPrice CHECK (Price > 0);
ALTER TABLE MedicalRecords ADD CONSTRAINT FK_DoctorID FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID);


