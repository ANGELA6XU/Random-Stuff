177. Nth HIghest Salary

第N高的薪水（难度：中等）

编写一个 SQL 查询，获取 Employee 表中第 n 高的薪水（Salary）。

+----+--------+
| Id | Salary |
+----+--------+
| 1  | 100    |
| 2  | 200    |
| 3  | 300    |
+----+--------+

例如上述 Employee 表，n = 2 时，应返回第二高的薪水 200。如果不存在第 n 高的薪水，那么查询应返回 null。

+------------------------+
| getNthHighestSalary(2) |
+------------------------+
| 200                    |
+------------------------+


Create table Employee (Id int, Salary int);
insert into Employee values('1', '100');
insert into Employee values('2', '200');
insert into Employee values('3', '300');


# Write MySQL query statement below
# 方法1: 176. Second Highest Salary 的扩展。解题思路一致：为了找到第 N 个高的数值，需要判断 N-1 个数值都大于它。

CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      # Write your MySQL query statement below.
      SELECT DISTINCT e1.Salary AS getNthHighestSalary 
      FROM Employee e1 
      WHERE (N-1) = (
      	SELECT COUNT(DISTINCT (e2.Salary)) 
      	FROM Employee e2 
      	WHERE e2.Salary > e1.Salary)
  );
END


# 方法2: LIMIT，OFFSET 的用法

CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN

# 在查询语句直接写(N-1)会报语法错误
Set N = N-1;

  RETURN (
      # Write your MySQL query statement below.
      SELECT DISTINCT Salary
      FROM Employee
      ORDER BY Salary
      DESC
      LIMIT N, 1
  );
END


