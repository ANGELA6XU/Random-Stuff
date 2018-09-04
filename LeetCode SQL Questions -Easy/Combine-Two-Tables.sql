175. Combine Two Tables

组合两个表（难度：简单）

表1: Person

+-------------+---------+
| 列名         | 类型     |
+-------------+---------+
| PersonId    | int     |
| FirstName   | varchar |
| LastName    | varchar |
+-------------+---------+
PersonId 是上表主键


表2: Address

+-------------+---------+
| 列名         | 类型    |
+-------------+---------+
| AddressId   | int     |
| PersonId    | int     |
| City        | varchar |
| State       | varchar |
+-------------+---------+
AddressId 是上表主键


编写一个 SQL 查询，满足条件：无论 person 是否有地址信息，都需要基于上述两表提供 person 的以下信息：
FirstName, LastName, City, State


Create table Person (PersonId int, FirstName varchar(255), LastName varchar(255));
Create table Address (AddressId int, PersonId int, City varchar(255), State varchar(255));
insert into Person (PersonId, LastName, FirstName) values ('1', 'Wang', 'Allen');
insert into Address (AddressId, PersonId, City, State) values ('1', '2', 'New York City', 'New York');


# Write MySQL query statement below
# 此题重点是 保留表1 person 中的所有信息

SELECT P.FirstName, P.LastName, A.City, A.State 
FROM Person AS P 
LEFT OUTER JOIN
Address AS A
ON P.PersonId = A.PersonId