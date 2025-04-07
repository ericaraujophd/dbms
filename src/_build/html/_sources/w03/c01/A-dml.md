# Class 1. Data Manipulation Commands (DML)

💡 Key SQL Syntax Examples (also used from Python):

## 1. INSERT:

```sql
INSERT INTO students (name, grade) VALUES ('Bob', 90);
```

## 2. UPDATE:

```sql
UPDATE students SET grade = 95 WHERE name = 'Bob';
```

## 3. DELETE:

```sql
DELETE FROM students WHERE name = 'Bob';
```

## 4. REPLACE (SQLite-specific):

```sql
REPLACE INTO students (id, name, grade) VALUES (1, 'Alice', 88);
```

If row with id=1 exists, it’s deleted and replaced.

## 5. UPSERT with ON CONFLICT:

```sql
INSERT INTO students (id, name, grade)
VALUES (1, 'Alice', 91)
ON CONFLICT(id) DO UPDATE SET grade = excluded.grade;
```

This command tries to insert a new student. If a student with the same `id = 1` already exists, instead of raising an error, it updates the existing row by setting its grade to 91.

**excluded** is a special keyword that refers to the values you tried to insert.

Only the column(s) explicitly listed in the UPDATE SET ... clause will be modified.

```{admonition} Talk to Your Neighbor
:class: tip
It the name changed? How would we update the name as well as the grade?
```

## 6. RETURNING:

```sql
DELETE FROM students WHERE grade < 60 RETURNING *;
```

| Feature   | SQLite        | PostgreSQL     | MySQL                 |
|-----------|---------------|----------------|------------------------|
| REPLACE   | ✅ Yes        | ❌ No          | ✅ Yes                |
| UPSERT    | ✅ ON CONFLICT| ✅ ON CONFLICT | ✅ ON DUPLICATE KEY   |
| RETURNING | ✅ (3.35+)    | ✅             | ✅ (8.0.19+)          |

class 1

updating sets of data
inserting sets of data
deleting sets of data
views
