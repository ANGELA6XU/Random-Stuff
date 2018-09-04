183. Customers Who Never Order

从不订购的客户（难度：简单）

某网站包含两个表，Customers 表和 Orders 表。编写一个 SQL 查询，找出所有从不订购任何东西的客户。

Customers 表：

+----+-------+
| Id | Name  |
+----+-------+
| 1  | Joe   |
| 2  | Henry |
| 3  | Sam   |
| 4  | Max   |
+----+-------+

Orders 表：

+----+------------+
| Id | CustomerId |
+----+------------+
| 1  | 3          |
| 2  | 1          |
+----+------------+

例如给定上述表格，你的查询应返回

+-----------+
| Customers |
+-----------+
| Henry     |
| Max       |
+-----------+


Create table Customers (Id int, Name varchar(255));
Create table Orders (Id int, CustomerId int);
insert into Customers values ('1', 'Joe');
insert into Customers values ('2', 'Henry');
insert into Customers values ('3', 'Sam');
insert into Customers values ('4', 'Max');
insert into Orders values ('1', '3');
insert into Orders values ('2', '1');


# Write MySQL query statement below
# 方法1: NOT IN 排除法

SELECT Name AS Customers
FROM Customers
WHERE Id NOT IN(
	SELECT CustomerId 
	FROM Orders);

# 方法2: LEFT JOIN + IS NULL 的用法

SELECT Name AS Customers
FROM Customers AS c
LEFT JOIN
Orders AS o
ON c.Id = o.CustomerId
WHERE o.CustomerId IS NULL;
