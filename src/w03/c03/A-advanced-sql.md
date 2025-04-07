# Class 3. CLI + Time

In this class we will learn:

1. How to use CLI for SQLite, and how to use the commands .mode, .import, .headers, .output, .schema
2. How to use CTEs to make queries more readable using WITH.
3. How to optimize our database files with VACUUM.

A summary of this class follows.

## Summary

### 1. CLI for SQLite

SQLite is a command-line interface (CLI) for SQLite databases. It allows you to interact with SQLite databases using SQL commands. The CLI provides several commands that can be used to manage and manipulate SQLite databases.

The following are some of the most commonly used commands in the SQLite CLI:

- `.mode`: This command is used to set the output mode of the SQLite CLI. The output mode can be set to various formats, such as CSV, HTML, or tab-separated values (TSV). For example, to set the output mode to CSV, you can use the following command:

```sql
.mode csv
```

- `.import`: This command is used to import data from a file into a SQLite database. The file can be in various formats, such as CSV or TSV. For example, to import data from a CSV file called `data.csv` into a table called `my_table`, you can use the following command:
  
```sql
.import data.csv my_table
```

- `.headers`: This command is used to set the headers for the output of the SQLite CLI. The headers can be set to on or off. For example, to set the headers to on, you can use the following command:

```sql
.headers on
```

- `.output`: This command is used to set the output file for the SQLite CLI. The output file can be in various formats, such as CSV or TSV. For example, to set the output file to `output.csv`, you can use the following command:

```sql
.output output.csv
```

- `.schema`: This command is used to display the schema of a SQLite database. The schema includes information about the tables, columns, and data types in the database. For example, to display the schema of a table called `my_table`, you can use the following command:

```sql
.schema my_table
```

- `.tables`: This command is used to display a list of tables in the SQLite database. For example, to display a list of tables, you can use the following command:

```sql
.tables
```

- `.exit`: This command is used to exit the SQLite CLI. For example, to exit the SQLite CLI, you can use the following command:

```sql
.exit
```

- `.help`: This command is used to display a list of available commands in the SQLite CLI. For example, to display a list of available commands, you can use the following command:

```sql
.help
```

### CTEs using WITH

CTEs (Common Table Expressions) are a powerful feature in SQL that allows you to create temporary result sets that can be referenced within a SELECT, INSERT, UPDATE, or DELETE statement. CTEs are defined using the WITH clause and can be used to simplify complex queries by breaking them down into smaller, more manageable parts.

CTEs can be used to create recursive queries, which are queries that reference themselves. This is useful for querying hierarchical data, such as organizational charts or file systems.

CTEs can also be used to create temporary views that can be referenced in other queries. This is useful for creating reusable query components that can be used in multiple places within a query.

Here is one example of how to use a CTE in SQL:

```sql
WITH cte_name AS (
    SELECT column1, column2
    FROM table_name
    WHERE condition1
)
SELECT *
FROM cte_name
WHERE condition2;
```

In this example, the CTE is defined using the WITH clause and is given the name `cte_name`. The CTE selects `column1` and `column2` from `table_name` where a certain condition is met. The main query then selects all columns from the CTE where another `condition2` is met.

### Optimizing database files with VACUUM

The VACUUM command is used to optimize SQLite database files by reclaiming unused space and defragmenting the database. This can help improve performance and reduce the size of the database file.

The VACUUM command creates a new database file and copies the contents of the original database file into the new file. This process removes any unused space and defragments the database, resulting in a smaller and more efficient database file. The original database file will be deleted, and the new file will replace it.

The VACUUM command can be run using the following SQL command:

```sql
VACUUM;
```

The VACUUM command can take some time to complete, depending on the size of the database file. It is recommended to run the VACUUM command during periods of low database activity to minimize the impact on performance.