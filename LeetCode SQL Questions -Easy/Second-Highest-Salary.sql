176. Second Highest Salary

 第二高的薪水（难度：简单）

 编写一个 SQL 查询，获取 Employee 表中第二高的薪水（Salary）。

+----+--------+
| Id | Salary |
+----+--------+
| 1  | 100    |
| 2  | 200    |
| 3  | 300    |
+----+--------+

例如上述 Employee 表，SQL查询应该返回 200 作为第二高的薪水。如果不存在第二高的薪水，那么查询应返回 null。

+---------------------+
| SecondHighestSalary |
+---------------------+
| 200                 |
+---------------------+

Create table Employee
( Id INTEGER, Salary INTEGER, PRIMARY KEY (Id));

INSERT INTO Employee VALUES ('1','100');
INSERT INTO Employee VALUES ('2','200');
INSERT INTO Employee VALUES ('3','300');

# Write MySQL query statement below
# 方法1: IFNULL + ORDER BY 的用法（limit 从第一行开始；否则会报错：subquery more 1 row）

 SELECT IFNULL(
 	(SELECT DISTINCT Salary 
 		FROM Employee 
 		ORDER BY Salary 
 		DESC 
 		LIMIT 1,1), NULL) AS SecondHighestSalary

# 方法2: 子查询
# 该列最大值 > 剩余中的最大值，即为第二大值

SELECT MAX(Salary) AS SecondHighestSalary 
FROM Employee 
WHERE (
	SELECT MAX(Salary) 
	FROM Employee) > Salary;
	
	
# 方法3: NOT IN 用法。从一个 不包含整表最大值 的集合中选取最大值。

SELECT MAX(Salary) AS SecondHighestSalary 
FROM Employee
WHERE Salary 
NOT IN 
(SELECT MAX(Salary) 
	FROM Employee);
