DELIMITER $$

CREATE PROCEDURE AddAppointment(
    IN p_PatientID INT,
    IN p_DoctorID INT,
    IN p_AppointmentDate DATETIME,
    IN p_Status ENUM('Scheduled', 'Completed', 'Cancelled')
)
BEGIN
    -- Kiểm tra xem bệnh nhân có tồn tại không
    IF NOT EXISTS (SELECT 1 FROM Patients WHERE PatientID = p_PatientID) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: Patient does not exist!';
    END IF;

    -- Kiểm tra xem bác sĩ có tồn tại không
    IF NOT EXISTS (SELECT 1 FROM Doctors WHERE DoctorID = p_DoctorID) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: Doctor does not exist!';
    END IF;

    -- Thêm lịch hẹn vào bảng Appointments
    INSERT INTO Appointments (PatientID, DoctorID, AppointmentDate, Status)
    VALUES (p_PatientID, p_DoctorID, p_AppointmentDate, p_Status);
END $$

DELIMITER ;

# Test :
CALL AddAppointment(1, 3, '2024-12-25 09:00:00', 'Scheduled');

