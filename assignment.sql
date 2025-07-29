CREATE DATABASE universitydb;

use universitydb;


-- 1. Student Table
CREATE TABLE Student (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100),
    gender VARCHAR(10),
    dob DATE,
    email VARCHAR(100),
    phone VARCHAR(15),
    address TEXT,
    aadhar_no VARCHAR(12) UNIQUE
);

-- 2. Course Table
CREATE TABLE Course (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(100),
    department VARCHAR(100),
    duration_years INT,
    total_seats INT
);

-- 3. Application Table
CREATE TABLE Application (
    application_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    application_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);

-- 4. Documents Table
CREATE TABLE Documents (
    doc_id INT PRIMARY KEY AUTO_INCREMENT,
    application_id INT,
    doc_type VARCHAR(50),
    file_path VARCHAR(255),
    FOREIGN KEY (application_id) REFERENCES Application(application_id)
);

-- 5. Admission Table
CREATE TABLE Admission (
    admission_id INT PRIMARY KEY AUTO_INCREMENT,
    application_id INT,
    admission_date DATE,
    fees_paid BOOLEAN,
    payment_mode VARCHAR(50),
    FOREIGN KEY (application_id) REFERENCES Application(application_id)
);

INSERT INTO Student (full_name, gender, dob, email, phone, address, aadhar_no)
VALUES 
('Rahul Sharma', 'Male', '2003-05-10', 'rahul@gmail.com', '9876543210', 'Delhi', '123412341234'),
('Anjali Mehta', 'Female', '2002-08-15', 'anjali@gmail.com', '8765432109', 'Mumbai', '234523452345'),
('Karan Verma', 'Male', '2004-01-12', 'karanv@gmail.com', '9988776655', 'Lucknow', '345634563456'),
('Sneha Reddy', 'Female', '2003-11-25', 'sneha.r@gmail.com', '8877665544', 'Hyderabad', '456745674567'),
('Arjun Desai', 'Male', '2002-09-09', 'arjund@gmail.com', '7788996655', 'Pune', '567856785678'),
('Pooja Nair', 'Female', '2003-03-30', 'pooja.n@gmail.com', '6677889900', 'Chennai', '678967896789'),
('Manish Jain', 'Male', '2001-07-07', 'manishj@gmail.com', '7564839201', 'Jaipur', '789078907890'),
('Riya Roy', 'Female', '2003-04-18', 'riya.roy@gmail.com', '9547283011', 'Kolkata', '890189018901'),
('Amit Thakur', 'Male', '2002-12-01', 'amit.t@gmail.com', '8123456789', 'Bhopal', '901290129012'),
('Neha Sinha', 'Female', '2004-06-14', 'nehasinha@gmail.com', '9432109876', 'Patna', '012301230123');

Select * from student;

INSERT INTO Course (course_name, department, duration_years, total_seats)
VALUES 
('B.Tech Computer Science', 'Engineering', 4, 60),
('BBA', 'Management', 3, 40),
('BA English', 'Arts', 3, 50),
('B.Sc Physics', 'Science', 3, 30),
('B.Com', 'Commerce', 3, 45);

select * from course;
INSERT INTO Application (student_id, course_id, application_date, status)
VALUES 
(1, 1, '2025-06-01', 'Applied'),
(2, 2, '2025-06-02', 'Admitted'),
(3, 1, '2025-06-03', 'Shortlisted'),
(4, 3, '2025-06-04', 'Admitted'),
(5, 4, '2025-06-05', 'Applied'),
(6, 5, '2025-06-06', 'Rejected'),
(7, 2, '2025-06-07', 'Admitted'),
(8, 3, '2025-06-08', 'Shortlisted'),
(9, 1, '2025-06-09', 'Applied'),
(10, 5, '2025-06-10', 'Admitted');

INSERT INTO Documents (application_id, doc_type, file_path)
VALUES 
(1, '10th Marksheet', '/docs/rahul_10.pdf'),
(1, '12th Marksheet', '/docs/rahul_12.pdf'),
(2, '10th Marksheet', '/docs/anjali_10.pdf'),
(2, '12th Marksheet', '/docs/anjali_12.pdf'),
(3, '10th Marksheet', '/docs/karan_10.pdf'),
(3, '12th Marksheet', '/docs/karan_12.pdf'),
(4, '10th Marksheet', '/docs/sneha_10.pdf'),
(4, '12th Marksheet', '/docs/sneha_12.pdf'),
(5, '10th Marksheet', '/docs/arjun_10.pdf'),
(5, '12th Marksheet', '/docs/arjun_12.pdf');

INSERT INTO Admission (application_id, admission_date, fees_paid, payment_mode)
VALUES 
(2, '2025-07-01', TRUE, 'UPI'),
(4, '2025-07-02', TRUE, 'NetBanking'),
(7, '2025-07-03', TRUE, 'Credit Card'),
(10, '2025-07-04', TRUE, 'UPI'),
(8, '2025-07-05', FALSE, NULL); -- Shortlisted but not paid

-- List of all students who applied
SELECT s.full_name, a.application_date, a.status 
FROM Student s
JOIN Application a ON s.student_id = a.student_id;

-- List of admitted students
SELECT s.full_name, c.course_name, ad.admission_date 
FROM Student s
JOIN Application a ON s.student_id = a.student_id
JOIN Admission ad ON a.application_id = ad.application_id
JOIN Course c ON a.course_id = c.course_id;





