197. Rising Temperature

上升的温度（难度：简单）

给定一个 Weather 表，编写一个 SQL 查询，来查找与之前（昨天的）日期相比温度更高的所有日期的 Id。

+---------+------------------+------------------+
| Id(INT) | RecordDate(DATE) | Temperature(INT) |
+---------+------------------+------------------+
|       1 |       2015-01-01 |               10 |
|       2 |       2015-01-02 |               25 |
|       3 |       2015-01-03 |               20 |
|       4 |       2015-01-04 |               30 |
+---------+------------------+------------------+

例如，根据上述给定的 Weather 表格，返回如下 Id:

+----+
| Id |
+----+
|  2 |
|  4 |
+----+


Create table Weather (Id int, RecordDate date, Temperature int);
insert into Weather values ('1', '2015-01-01', '10');
insert into Weather values ('2', '2015-01-02', '25');
insert into Weather values ('3', '2015-01-03', '20');
insert into Weather values ('4', '2015-01-04', '30');


# Write MySQL query statement below
# 方法1: 使用 Datediff 来计算两个日期的差值。

SELECT w1.Id 
FROM Weather AS w1
INNER JOIN
Weather AS w2
ON
DATEDIFF(w1.RecordDate, w2.RecordDate) = 1;
AND
w1.Temperature > w2.Temperature


# 方法2: 使用 TO_DAYS 函数，将日期换算成天数，直接用 WHERE 来连接两表。

SELECT w1.Id
FROM Weather AS w1, Weather AS w2
WHERE w1.Temperature > w2.Temperature
AND
TO_DAYS(w1.RecordDate) - TO_DAYS(w2.RecordDate) = 1;
