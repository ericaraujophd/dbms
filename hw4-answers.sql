-- =====================
-- Clubs Homework - Full SQL Bundle
-- =====================

-- Drop existing tables and view if they exist
DROP VIEW IF EXISTS StudentClubCount;
DROP TABLE IF EXISTS Memberships;
DROP TABLE IF EXISTS Students;
DROP TABLE IF EXISTS Clubs;

-- =============
-- Schema Creation
-- =============

-- Students Table
CREATE TABLE Students (
  student_id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  major TEXT NOT NULL,
  year INTEGER CHECK (year BETWEEN 1 AND 5)
);

-- Clubs Table
CREATE TABLE Clubs (
  club_id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  foundation_year INTEGER
);

-- Memberships Table
CREATE TABLE Memberships (
  student_id INTEGER,
  club_id INTEGER,
  joined_date DATE,
  role TEXT CHECK (role IN ('member', 'president', 'secretary')),
  PRIMARY KEY (student_id, club_id),
  FOREIGN KEY (student_id) REFERENCES Students(student_id),
  FOREIGN KEY (club_id) REFERENCES Clubs(club_id)
);

-- =============
-- Data Insertion
-- =============

-- Students
INSERT INTO Students (student_id, name, major, year) VALUES
(1, 'Alice', 'Computer Science', 3),
(2, 'Bob', 'Mathematics', 2),
(3, 'Carol', 'Biology', 4),
(4, 'Dave', 'History', 1),
(5, 'Eva', 'Physics', 5),
(6, 'Frank', 'Literature', 3),
(7, 'Grace', 'Chemistry', 2),
(8, 'Henry', 'Computer Science', 4);

-- Clubs
INSERT INTO Clubs (club_id, name, foundation_year) VALUES
(1, 'Robotics Club', 2005),
(2, 'Debate Club', 2015),
(3, 'Chess Club', 1999),
(4, 'Environmentalists', 2012);

-- Memberships
INSERT INTO Memberships (student_id, club_id, joined_date, role) VALUES
(1, 1, '2023-01-10', 'president'),
(1, 3, '2024-02-14', 'member'),
(2, 3, '2023-09-01', 'member'),
(3, 2, '2024-03-03', 'secretary'),
(4, 1, '2024-01-15', 'member'),
(5, 2, '2023-11-11', 'member'),
(5, 4, '2024-03-12', 'president'),
(6, 4, '2024-03-12', 'member'),
(7, 3, '2024-03-20', 'member'),
(8, 1, '2023-04-01', 'secretary'),
(8, 2, '2023-10-10', 'member');

-- =============
-- View Creation
-- =============

CREATE VIEW StudentClubCount AS
SELECT s.student_id, s.name, COUNT(m.club_id) AS club_count
FROM Students s
LEFT JOIN Memberships m ON s.student_id = m.student_id
GROUP BY s.student_id;

-- =============
-- Queries (Answers)
-- =============

-- 1. Clubs founded before 2010
SELECT *
FROM Clubs
WHERE foundation_year < 2010;
-- Expected Results:
-- | club_id | name           | foundation_year |
-- |---------|----------------|-----------------|
-- | 1       | Robotics Club  | 2005            |
-- | 3       | Chess Club     | 1999            |

-- 2. Students who are presidents of more than one club
SELECT student_id
FROM Memberships
WHERE role = 'president'
GROUP BY student_id
HAVING COUNT(*) > 1;
-- Expected Results: (no rows)

-- 3. Each club and number of students
SELECT c.name, COUNT(m.student_id) AS member_count
FROM Clubs c
LEFT JOIN Memberships m ON c.club_id = m.club_id
GROUP BY c.club_id;
-- Expected Results:
-- | name              | member_count |
-- |-------------------|--------------|
-- | Robotics Club     | 3            |
-- | Debate Club       | 3            |
-- | Chess Club        | 3            |
-- | Environmentalists | 2            |

-- 4. Students with no clubs
SELECT s.name
FROM Students s
LEFT JOIN Memberships m ON s.student_id = m.student_id
WHERE m.student_id IS NULL;
-- Expected Results:
-- (no rows — all students are in at least one club)

-- 5. Top 3 clubs with most members
SELECT c.name, COUNT(m.student_id) AS member_count
FROM Clubs c
JOIN Memberships m ON c.club_id = m.club_id
GROUP BY c.club_id
ORDER BY member_count DESC
LIMIT 3;
-- Expected Results:
-- | name            | member_count |
-- |-----------------|--------------|
-- | Robotics Club   | 3            |
-- | Debate Club     | 3            |
-- | Chess Club      | 3            |

-- 6. Students who are members of more than one club
SELECT *
FROM StudentClubCount
WHERE club_count > 1;
-- Expected Results:
-- | student_id | name  | club_count |
-- |------------|-------|------------|
-- | 1          | Alice | 2          |
-- | 5          | Eva   | 2          |
-- | 8          | Henry | 2          |

-- 7. Average number of clubs per student
SELECT ROUND(AVG(club_count), 2) AS avg_clubs
FROM StudentClubCount;
-- Expected Results:
-- | avg_clubs |
-- |-----------|
-- | 1.38      |
