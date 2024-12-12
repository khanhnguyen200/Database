USE hospital_management;
SELECT
    Appointments.AppointmentID,
    Patients.FullName AS PatientName,
    Doctors.FullName AS DoctorName,
    Appointments.AppointmentDate,
    Appointments.Status
FROM
    Appointments
INNER JOIN Patients ON Appointments.PatientID = Patients.PatientID
INNER JOIN Doctors ON Appointments.DoctorID = Doctors.DoctorID;

SELECT
    Patients.PatientID,
    Patients.FullName AS PatientName,
    Appointments.AppointmentDate,
    Appointments.Status
FROM
    Patients
LEFT OUTER JOIN Appointments ON Patients.PatientID = Appointments.PatientID;

SELECT
    FullName AS DoctorName
FROM
    Doctors
WHERE
    DoctorID IN (
        SELECT DISTINCT DoctorID
        FROM MedicalRecords
    );

SELECT
    Doctors.FullName AS DoctorName,
    CompletedAppointments.TotalCompleted
FROM
    Doctors
LEFT JOIN (
    SELECT
        DoctorID,
        COUNT(*) AS TotalCompleted
    FROM
        Appointments
    WHERE
        Status = 'Completed'
    GROUP BY
        DoctorID
) AS CompletedAppointments ON Doctors.DoctorID = CompletedAppointments.DoctorID;

SELECT
    Doctors.FullName AS DoctorName,
    COUNT(DISTINCT MedicalRecords.PatientID) AS TotalPatients
FROM
    MedicalRecords
INNER JOIN Doctors ON MedicalRecords.DoctorID = Doctors.DoctorID
GROUP BY
    Doctors.DoctorID;

