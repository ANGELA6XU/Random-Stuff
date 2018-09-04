182. Duplicate Emails

查找重复的电子邮箱（难度：简单）

编写一个 SQL 查询，查找 Person 表中所有重复的电子邮箱。

+----+---------+
| Id | Email   |
+----+---------+
| 1  | a@b.com |
| 2  | c@d.com |
| 3  | a@b.com |
+----+---------+

Create table Person (Id int, Email varchar(255));
insert into Person values ('1', 'a@b.com');
insert into Person values ('2', 'c@d.com');
insert into Person values ('3', 'a@b.com');

# Write MySQL query statement below
# 考察点：找出重复数据，GROUP BY 分组，分组后的数据行大于 1 即为结果

SELECT Email 
FROM Person 
GROUP BY Email
HAVING COUNT(Email)>1;