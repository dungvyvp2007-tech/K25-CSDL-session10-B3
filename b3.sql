-- Bảng Khoa
CREATE TABLE Departments (
    Dept_ID INT PRIMARY KEY,
    Dept_Name VARCHAR(100)
);

-- Bảng Bệnh nhân
CREATE TABLE Patients (
    Patient_ID INT PRIMARY KEY,
    Patient_Name VARCHAR(100)
);

-- Bảng Hóa đơn
CREATE TABLE Invoices (
    Invoice_ID INT PRIMARY KEY,
    Patient_ID INT,
    Dept_ID INT,
    Amount DECIMAL(10, 2),
    FOREIGN KEY (Patient_ID) REFERENCES Patients(Patient_ID),
    FOREIGN KEY (Dept_ID) REFERENCES Departments(Dept_ID)
);

-- 2. CHÈN DỮ LIỆU MẪU
INSERT INTO Departments 
VALUES 
(1, 'Nội'),
(2, 'Ngoại');

INSERT INTO Patients 
VALUES 
(1, 'Nguyễn Văn A'), 
(2, 'Trần Thị B'), 
(3, 'Lê Văn C');

INSERT INTO Invoices 
VALUES 
(101, 1, 1, 500.00), 
(102, 2, 1, 300.00), 
(103, 3, 2, 1000.00);

-- 3. TẠO VIEW BÁO CÁO DOANH THU
CREATE VIEW Department_Revenue_View AS
SELECT 
    d.Dept_Name,
    COUNT(DISTINCT i.Patient_ID) AS Total_Patients,
    SUM(i.Amount) AS Total_Revenue
FROM Departments d
JOIN Invoices i ON d.Dept_ID = i.Dept_ID
GROUP BY d.Dept_Name;

-- 4. KIỂM THỬ TRUY VẤN
SELECT * FROM Department_Revenue_View;

/*
UPDATE Department_Revenue_View
SET Total_Revenue = 2000.00
WHERE Dept_Name = 'Nội';
*/
