196. Delect Duplicate Emails

删除重复的电子邮箱（难度：简单）

编写一个 SQL 查询，来删除 Person2 表中所有重复的电子邮箱，重复的邮箱里只保留 Id 最小 的那个。

+----+------------------+
| Id | Email            |
+----+------------------+
| 1  | john@example.com |
| 2  | bob@example.com  |
| 3  | john@example.com |
+----+------------------+
Id 是这个表的主键。


Create table Person2 (Id int, Email varchar(255));
insert into Person2 values ('1', 'john@example.com');
insert into Person2 values ('2', 'bob@example.com');
insert into Person2 values ('3', 'john@example.com');

# Write MySQL query statement below
#方法1: DELETE + INNER JOIN 的用法

DELETE p1 FROM Person2 AS p1
INNER JOIN Person2 AS p2
ON p1.Email = p2.Email
WHERE p1.Id > p2.Id;


#方法2: 先按 Email 分组，得到分组后的 id，删除不包含这些 id 的数据
 
DELETE FROM Person2 
WHERE Id NOT IN 
(SELECT Id 
	FROM (
		SELECT MIN(Id) AS Id 
		FROM Person2 
		GROUP BY Email) AS p);


#方法3: 直接用 WHERE 关联两个表

DELETE p1 FROM Person2 AS p1, Person2 AS p2
WHERE p1.Email = p2.Email 
AND p1.Id > p2.Id;
