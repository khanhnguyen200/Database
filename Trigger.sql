-- Tạo Trigger để tự động cập nhật trạng thái của lịch hẹn
DELIMITER $$

CREATE TRIGGER UpdateAppointmentStatusAfterMedicalRecord
AFTER INSERT ON MedicalRecords
FOR EACH ROW
BEGIN
    -- Cập nhật trạng thái của lịch hẹn thành 'Completed'
    UPDATE Appointments
    SET Status = 'Completed'
    WHERE PatientID = NEW.PatientID AND DoctorID = NEW.DoctorID AND Status = 'Scheduled';
END $$

DELIMITER ;

# Test Trigger :
INSERT INTO MedicalRecords (PatientID, DoctorID, Diagnosis, Treatment, Date)
VALUES (1, 3, 'Tension Headache', 'Prescribed relaxation techniques', '2024-12-20');
# Check Trigger :
SELECT * FROM Appointments WHERE PatientID = 1 AND DoctorID = 3;
