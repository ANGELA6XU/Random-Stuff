181. Employees Earning More Than Their Managers

 超过经理收入的员工（难度：简单）

 Employee 表包含所有员工，他们的经理也属于员工。每个员工都有一个 Id，此外还有一列对应员工的经理的 Id。

+----+-------+--------+-----------+
| Id | Name  | Salary | ManagerId |
+----+-------+--------+-----------+
| 1  | Joe   | 70000  | 3         |
| 2  | Henry | 80000  | 4         |
| 3  | Sam   | 60000  | NULL      |
| 4  | Max   | 90000  | NULL      |
+----+-------+--------+-----------+

给定 Employee 表，编写一个 SQL 查询，该查询可以获取收入超过他们经理的员工的姓名。在上面的表格中，Joe 是唯一一个收入超过他的经理的员工。

+----------+
| Employee |
+----------+
| Joe      |
+----------+


Create table Employee (Id CHAR(4), Name varchar(255), Salary int, ManagerId CHAR(4));
insert into Employee values ('1', 'Joe', '70000','3');
insert into Employee values ('2', 'Henry','80000','4');
insert into Employee values ('3', 'Sam','60000','NULL');
insert into Employee values ('4', 'Max','90000', 'NULL');

# Write MySQL query statement below
# 考察点：inner join 的用法

SELECT a.Name AS Employee 
FROM Employee AS a
INNER JOIN 
Employee AS b
ON a.ManagerId = b.Id
WHERE a.Salary > b.Salary;