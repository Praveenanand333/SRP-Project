-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 30, 2024 at 05:25 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ist_dept`
--

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `roll_number` int(11) DEFAULT NULL,
  `event_name` varchar(255) DEFAULT NULL,
  `institution` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `role` enum('Participate','Conduct/Manage') DEFAULT NULL,
  `awards` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `roll_number`, `event_name`, `institution`, `date`, `role`, `awards`) VALUES
(1, 111, 'Itrix', 'IST', '0000-00-00', 'Participate', 'First');

-- --------------------------------------------------------

--
-- Table structure for table `exams_attended`
--

CREATE TABLE `exams_attended` (
  `id` int(11) NOT NULL,
  `roll_number` int(11) DEFAULT NULL,
  `GATE_score` decimal(10,2) DEFAULT NULL,
  `GRE_score` decimal(10,2) DEFAULT NULL,
  `TOEFL_score` decimal(10,2) DEFAULT NULL,
  `IELTS_score` decimal(10,2) DEFAULT NULL,
  `UPSC_score` decimal(10,2) DEFAULT NULL,
  `NET_score` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gpa`
--

CREATE TABLE `gpa` (
  `rollnumber` int(11) NOT NULL,
  `gpa` float DEFAULT NULL,
  `semester` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gpa`
--

INSERT INTO `gpa` (`rollnumber`, `gpa`, `semester`) VALUES
(111, 8.3, 1),
(111, 7.5, 2),
(111, 9.1, 3),
(111, 6.8, 4),
(111, 8.7, 5),
(111, 7.2, 6);

-- --------------------------------------------------------

--
-- Table structure for table `internship`
--

CREATE TABLE `internship` (
  `id` int(11) NOT NULL,
  `roll_number` int(11) DEFAULT NULL,
  `employer_name` varchar(255) DEFAULT NULL,
  `on_off_campus` enum('On Campus','Off Campus') DEFAULT NULL,
  `ctc` decimal(10,2) DEFAULT NULL,
  `InternshipDuration` varchar(50) DEFAULT NULL,
  `InternshipStartDate` date DEFAULT NULL,
  `InternshipEndDate` date DEFAULT NULL,
  `product_service_based` enum('Product Based','Service Based') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `internship`
--

INSERT INTO `internship` (`id`, `roll_number`, `employer_name`, `on_off_campus`, `ctc`, `InternshipDuration`, `InternshipStartDate`, `InternshipEndDate`, `product_service_based`) VALUES
(2, 111, 'sample', 'On Campus', 2000.00, '2 months', '2024-03-05', '2024-03-06', 'Product Based');

-- --------------------------------------------------------

--
-- Table structure for table `marks`
--

CREATE TABLE `marks` (
  `RollNumber` int(11) NOT NULL,
  `SubjectID` varchar(50) NOT NULL,
  `Semester` int(11) NOT NULL,
  `MarksObtained` int(11) DEFAULT NULL,
  `Grade` varchar(5) DEFAULT NULL,
  `verified_status` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `marks`
--

INSERT INTO `marks` (`RollNumber`, `SubjectID`, `Semester`, `MarksObtained`, `Grade`, `verified_status`) VALUES
(111, 'BS5161', 1, 89, 'A+', 1),
(111, 'CY5151', 1, 71, 'A', 1),
(111, 'E5251', 4, 88, 'A+', 0),
(111, 'EC5693', 6, 85, 'A+', 0),
(111, 'EE5251', 2, 100, 'O', 0),
(111, 'EE5261', 2, 63, 'B+', 0),
(111, 'GE5151', 2, 67, 'B+', 0),
(111, 'GE5153', 1, 80, 'A+', 1),
(111, 'GE5161', 1, 84, 'A+', 1),
(111, 'HS5151', 1, 82, 'A+', 1),
(111, 'HS5251', 2, 98, 'O', 0),
(111, 'IT5014', 6, 75, 'A', 0),
(111, 'IT5020', 6, 92, 'O', 0),
(111, 'IT5201', 2, 86, 'A+', 0),
(111, 'IT5211', 2, 86, 'A+', 0),
(111, 'IT5301', 3, 92, 'O', 0),
(111, 'IT5302', 3, 63, 'B+', 0),
(111, 'IT5311', 3, 94, 'O', 0),
(111, 'IT5312', 3, 77, 'A', 0),
(111, 'IT5351', 3, 54, 'B', 0),
(111, 'IT5352', 3, 91, 'O', 0),
(111, 'IT5402', 4, 97, 'O', 0),
(111, 'IT5403', 4, 96, 'O', 0),
(111, 'IT5411', 4, 91, 'O', 0),
(111, 'IT5412', 4, 66, 'B+', 0),
(111, 'IT5501', 5, 86, 'A+', 0),
(111, 'IT5502', 5, 58, 'B', 0),
(111, 'IT5511', 5, 86, 'A+', 0),
(111, 'IT5512', 5, 55, 'B', 0),
(111, 'IT5513', 5, 67, 'B+', 0),
(111, 'IT5551', 5, 69, 'B+', 0),
(111, 'IT5601', 6, 68, 'B', 0),
(111, 'IT5602', 6, 80, 'A+', 0),
(111, 'IT5603', 6, 55, 'B', 0),
(111, 'IT5611', 6, 72, 'B', 0),
(111, 'IT5612', 6, 88, 'A', 0),
(111, 'IT5613', 6, 60, 'B+', 0),
(111, 'MA5158', 1, 58, 'B', 1),
(111, 'MA5252', 2, 72, 'A', 0),
(111, 'MA5302', 3, 93, 'O', 0),
(111, 'PH5151', 1, 95, 'O', 1);

-- --------------------------------------------------------

--
-- Table structure for table `paper_published`
--

CREATE TABLE `paper_published` (
  `id` int(11) NOT NULL,
  `roll_number` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `journal` varchar(255) DEFAULT NULL,
  `date_year` date DEFAULT NULL,
  `DOI_link` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `paper_published`
--

INSERT INTO `paper_published` (`id`, `roll_number`, `title`, `journal`, `date_year`, `DOI_link`) VALUES
(1, 111, 'CTG Fetal Risk Classification', 'IEEE', '0000-00-00', 'ieee.com');

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `id` int(11) NOT NULL,
  `roll_number` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `guide` varchar(255) DEFAULT NULL,
  `project_desc` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`id`, `roll_number`, `title`, `guide`, `project_desc`) VALUES
(1, 111, 'SRP-Project', 'ABC', 'Socially Relavent Project');

-- --------------------------------------------------------

--
-- Table structure for table `scholarship`
--

CREATE TABLE `scholarship` (
  `id` int(11) NOT NULL,
  `roll_number` int(11) DEFAULT NULL,
  `ScholarshipProvider` varchar(255) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `scholarship`
--

INSERT INTO `scholarship` (`id`, `roll_number`, `ScholarshipProvider`, `amount`) VALUES
(1, 111, 'Aram', 50000.00),
(5, 111, 'LMES', 10000.00);

-- --------------------------------------------------------

--
-- Table structure for table `sports`
--

CREATE TABLE `sports` (
  `id` int(11) NOT NULL,
  `roll_number` int(11) DEFAULT NULL,
  `event_name` varchar(255) DEFAULT NULL,
  `award` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sports`
--

INSERT INTO `sports` (`id`, `roll_number`, `event_name`, `award`) VALUES
(4, 111, 'abc', 'sample');

-- --------------------------------------------------------

--
-- Table structure for table `studentdetails`
--

CREATE TABLE `studentdetails` (
  `RollNumber` int(11) NOT NULL,
  `DateOfBirth` date DEFAULT NULL,
  `Address` varchar(500) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `Sex` enum('Male','Female') DEFAULT NULL,
  `Blood_Group` varchar(10) DEFAULT NULL,
  `FatherName` varchar(50) DEFAULT NULL,
  `Mothername` varchar(50) DEFAULT NULL,
  `Fatheroccupation` varchar(50) DEFAULT NULL,
  `Motheroccupation` varchar(50) DEFAULT NULL,
  `StudentImage` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `studentdetails`
--

INSERT INTO `studentdetails` (`RollNumber`, `DateOfBirth`, `Address`, `Phone`, `Sex`, `Blood_Group`, `FatherName`, `Mothername`, `Fatheroccupation`, `Motheroccupation`, `StudentImage`) VALUES
(111, '2024-03-13', 'Vaagai Hostels,CEG', '123', 'Male', 'O+', 'Father', 'Mother Name', 'Father Occupation', 'Mother Occupation', 'image_1710507843345.png'),
(222, '2024-03-04', 'Vaagai Hostels,CEG', '12345678', 'Male', 'o', 'afd', 'dsfs', 'afd', 'adf', 'image_1710510375502.png');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `RollNumber` int(11) NOT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `FacultyAdvisorID` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`RollNumber`, `FirstName`, `LastName`, `Email`, `FacultyAdvisorID`) VALUES
(111, 'anand', 'kumar', 'anand@gmail.com', 'po1');

-- --------------------------------------------------------

--
-- Table structure for table `student_academic_details`
--

CREATE TABLE `student_academic_details` (
  `RollNumber` int(11) NOT NULL,
  `CurrentSemester` int(11) DEFAULT NULL,
  `TenthMarks` int(11) DEFAULT NULL,
  `HigherSecondaryMarks` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student_academic_details`
--

INSERT INTO `student_academic_details` (`RollNumber`, `CurrentSemester`, `TenthMarks`, `HigherSecondaryMarks`) VALUES
(111, 6, 490, 590);

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `SubjectID` varchar(50) NOT NULL,
  `SubjectName` varchar(50) DEFAULT NULL,
  `Type` enum('core','prof-elective','humanities-elective','optional','open-elective') NOT NULL,
  `Semester` int(11) DEFAULT NULL,
  `credits` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`SubjectID`, `SubjectName`, `Type`, `Semester`, `credits`) VALUES
('BS5161', 'Basic Sciences Laboratory', 'core', 1, 2),
('CY5151', 'Engineering Chemistry', 'core', 1, 3),
('E5251', 'Environmental Sciences', 'core', 4, 3),
('EC5693', 'WIRELESS TECHNOLOGIES', 'open-elective', 6, 3),
('EE5251', 'Basics of Electrical and Electronics Engineering', 'core', 2, 3),
('EE5261', 'Electrical and Electronics Engineering Laboratory', 'core', 2, 2),
('GE5151', 'Engineering Graphics', 'core', 2, 3),
('GE5153', 'Problem Solving and Python Programming', 'core', 1, 3),
('GE5161', 'Problem Solving and Python Programming Laboratory', 'core', 1, 2),
('HS5151', 'Technical English', 'core', 1, 4),
('HS5251', 'Professional Communication', 'core', 2, 4),
('IT5014', 'C# AND .NET PROGRAMMING', 'prof-elective', 6, 3),
('IT5020', 'SOCIAL NETWORK ANALYSIS', 'prof-elective', 6, 3),
('IT5201', 'Information Technology Essentials', 'core', 2, 3),
('IT5211', 'Information Technology Essentials Laboratory', 'core', 2, 2),
('IT5301', 'Digital Logic and Design', 'core', 3, 3),
('IT5302', 'Software Engineering', 'core', 3, 3),
('IT5311', 'Programming and Data Structures Laboratory', 'core', 3, 2),
('IT5312', 'Database Management Systems Laboratory', 'core', 3, 2),
('IT5351', 'Database Management Systems', 'core', 3, 3),
('IT5352', 'Programming and Data Structures', 'core', 3, 3),
('IT5401', 'Object Oriented Programming and Advanced Data Stru', 'core', 4, 3),
('IT5402', 'Design and Analysis of Algorithms', 'core', 4, 3),
('IT5403', 'Operating Systems', 'core', 4, 3),
('IT5411', 'Operating Systems Laboratory', 'core', 4, 2),
('IT5412', 'Advanced Data Structures Laboratory', 'core', 4, 2),
('IT5451', 'Computer Architecture', 'core', 5, 3),
('IT5501', 'Web Technologies', 'core', 5, 3),
('IT5502', 'Compiler Engineering', 'core', 5, 3),
('IT5511', 'Computer Networks Laboratory', 'core', 5, 2),
('IT5512', 'Web Technologies Laboratory', 'core', 5, 2),
('IT5513', 'Summer Internship /Summer Project', 'core', 5, 2),
('IT5551', 'Computer Networks', 'core', 5, 3),
('IT5601', 'EMBEDDED SYSTEMS AND INTERNET OF THINGS', 'core', 6, 3),
('IT5602', 'DATA SCIENCE AND ANALYTICS', 'core', 6, 3),
('IT5603', 'DISTRIBUTED AND CLOUD COMPUTING', 'core', 6, 3),
('IT5611', 'EMBEDDED SYSTEMS AND INTERNET OF THINGS LABORATORY', 'core', 6, 3),
('IT5612', 'DATA ANALYTICS AND CLOUD COMPUTING LABORATORY', 'core', 6, 3),
('IT5613', 'SOCIALLY RELEVANT PROJECT LABORATORY', 'core', 6, 3),
('MA5158', 'Engineering Mathematics I', 'core', 1, 4),
('MA5252', 'Engineering Mathematics II', 'core', 2, 4),
('MA5302', 'Discrete Mathematics', 'core', 3, 4),
('PH5151', 'Engineering Physics', 'core', 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `TeacherID` varchar(50) NOT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Designation` enum('professor','assisstant-professor','associate-professor','teaching-fellow','HOD') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`TeacherID`, `FirstName`, `LastName`, `Email`, `Designation`) VALUES
('po1', 'sample', 'professor', 'sp@gmail.com', 'professor'),
('T001', 'John', 'Doe', 'john.doe@example.com', 'professor'),
('T002', 'Jane', 'Smith', 'jane.smith@example.com', ''),
('T003', 'Michael', 'Johnson', 'michael.johnson@example.com', 'associate-professor'),
('T004', 'Emily', 'Williams', 'emily.williams@example.com', 'teaching-fellow'),
('T005', 'David', 'Brown', 'david.brown@example.com', 'HOD'),
('T006', 'Sarah', 'Taylor', 'sarah.taylor@example.com', 'professor'),
('T007', 'Daniel', 'Anderson', 'daniel.anderson@example.com', ''),
('T008', 'Jessica', 'Martinez', 'jessica.martinez@example.com', 'associate-professor'),
('T009', 'Christopher', 'Garcia', 'christopher.garcia@example.com', 'teaching-fellow'),
('T010', 'Lisa', 'Robinson', 'lisa.robinson@example.com', 'HOD');

-- --------------------------------------------------------

--
-- Table structure for table `teachersubjects`
--

CREATE TABLE `teachersubjects` (
  `TeacherID` varchar(50) NOT NULL,
  `SubjectID` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `teachersubjects`
--

INSERT INTO `teachersubjects` (`TeacherID`, `SubjectID`) VALUES
('T001', 'EC5693'),
('T002', 'IT5014'),
('T003', 'IT5020'),
('T004', 'IT5601'),
('T005', 'IT5602'),
('T006', 'IT5603'),
('T007', 'IT5611'),
('T008', 'IT5612'),
('T009', 'IT5613');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` int(11) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('student','teacher','hod') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`) VALUES
(7, 111, '111', 'student'),
(8, 222, '222', 'student'),
(9, 333, '333', 'teacher');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `roll_number` (`roll_number`);

--
-- Indexes for table `exams_attended`
--
ALTER TABLE `exams_attended`
  ADD PRIMARY KEY (`id`),
  ADD KEY `roll_number` (`roll_number`);

--
-- Indexes for table `gpa`
--
ALTER TABLE `gpa`
  ADD PRIMARY KEY (`rollnumber`,`semester`);

--
-- Indexes for table `internship`
--
ALTER TABLE `internship`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `roll_number` (`roll_number`);

--
-- Indexes for table `marks`
--
ALTER TABLE `marks`
  ADD PRIMARY KEY (`RollNumber`,`SubjectID`,`Semester`),
  ADD KEY `SubjectID` (`SubjectID`);

--
-- Indexes for table `paper_published`
--
ALTER TABLE `paper_published`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `roll_number` (`roll_number`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `roll_number` (`roll_number`);

--
-- Indexes for table `scholarship`
--
ALTER TABLE `scholarship`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `roll_number` (`roll_number`);

--
-- Indexes for table `sports`
--
ALTER TABLE `sports`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `roll_number` (`roll_number`);

--
-- Indexes for table `studentdetails`
--
ALTER TABLE `studentdetails`
  ADD PRIMARY KEY (`RollNumber`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`RollNumber`),
  ADD KEY `FacultyAdvisorID` (`FacultyAdvisorID`);

--
-- Indexes for table `student_academic_details`
--
ALTER TABLE `student_academic_details`
  ADD PRIMARY KEY (`RollNumber`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`SubjectID`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`TeacherID`);

--
-- Indexes for table `teachersubjects`
--
ALTER TABLE `teachersubjects`
  ADD PRIMARY KEY (`TeacherID`,`SubjectID`),
  ADD KEY `SubjectID` (`SubjectID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `exams_attended`
--
ALTER TABLE `exams_attended`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `internship`
--
ALTER TABLE `internship`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `paper_published`
--
ALTER TABLE `paper_published`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `project`
--
ALTER TABLE `project`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `scholarship`
--
ALTER TABLE `scholarship`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `sports`
--
ALTER TABLE `sports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_ibfk_1` FOREIGN KEY (`roll_number`) REFERENCES `students` (`RollNumber`);

--
-- Constraints for table `exams_attended`
--
ALTER TABLE `exams_attended`
  ADD CONSTRAINT `exams_attended_ibfk_1` FOREIGN KEY (`roll_number`) REFERENCES `students` (`RollNumber`);

--
-- Constraints for table `internship`
--
ALTER TABLE `internship`
  ADD CONSTRAINT `internship_ibfk_1` FOREIGN KEY (`roll_number`) REFERENCES `students` (`RollNumber`);

--
-- Constraints for table `marks`
--
ALTER TABLE `marks`
  ADD CONSTRAINT `marks_ibfk_1` FOREIGN KEY (`RollNumber`) REFERENCES `students` (`RollNumber`),
  ADD CONSTRAINT `marks_ibfk_2` FOREIGN KEY (`SubjectID`) REFERENCES `subjects` (`SubjectID`);

--
-- Constraints for table `paper_published`
--
ALTER TABLE `paper_published`
  ADD CONSTRAINT `paper_published_ibfk_1` FOREIGN KEY (`roll_number`) REFERENCES `students` (`RollNumber`);

--
-- Constraints for table `project`
--
ALTER TABLE `project`
  ADD CONSTRAINT `project_ibfk_1` FOREIGN KEY (`roll_number`) REFERENCES `students` (`RollNumber`);

--
-- Constraints for table `scholarship`
--
ALTER TABLE `scholarship`
  ADD CONSTRAINT `scholarship_ibfk_1` FOREIGN KEY (`roll_number`) REFERENCES `students` (`RollNumber`);

--
-- Constraints for table `sports`
--
ALTER TABLE `sports`
  ADD CONSTRAINT `sports_ibfk_1` FOREIGN KEY (`roll_number`) REFERENCES `students` (`RollNumber`);

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`FacultyAdvisorID`) REFERENCES `teachers` (`TeacherID`);

--
-- Constraints for table `student_academic_details`
--
ALTER TABLE `student_academic_details`
  ADD CONSTRAINT `student_academic_details_ibfk_1` FOREIGN KEY (`RollNumber`) REFERENCES `students` (`RollNumber`);

--
-- Constraints for table `teachersubjects`
--
ALTER TABLE `teachersubjects`
  ADD CONSTRAINT `teachersubjects_ibfk_1` FOREIGN KEY (`TeacherID`) REFERENCES `teachers` (`TeacherID`),
  ADD CONSTRAINT `teachersubjects_ibfk_2` FOREIGN KEY (`SubjectID`) REFERENCES `subjects` (`SubjectID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
