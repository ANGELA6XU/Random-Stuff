178. Rank Scores

分数排名（难度：中等）

编写一个 SQL 查询来实现分数排名。如果两个分数相同，则两个分数排名（Rank）相同。
请注意，平分后的下一个名次应该是下一个连续的整数值。换句话说，名次之间不应该有“间隔”。

+----+-------+
| Id | Score |
+----+-------+
| 1  | 3.50  |
| 2  | 3.65  |
| 3  | 4.00  |
| 4  | 3.85  |
| 5  | 4.00  |
| 6  | 3.65  |
+----+-------+

例如，根据上述给定的 Scores 表，你的查询应该返回（按分数从高到低排列）：

+-------+------+
| Score | Rank |
+-------+------+
| 4.00  | 1    |
| 4.00  | 1    |
| 3.85  | 2    |
| 3.65  | 3    |
| 3.65  | 3    |
| 3.50  | 4    |
+-------+------+


Create table Scores (Id int, Score DECIMAL(3,2));
insert into Scores values ('1', '3.5');
insert into Scores values ('2', '3.65');
insert into Scores values ('3', '4.0');
insert into Scores values ('4', '3.85');
insert into Scores values ('5', '4.0');
insert into Scores values ('6', '3.65');


# Write MySQL query statement below
#方法1：Score 从大到小排，Rank 显示为有多少个数字大于等于该数字。

SELECT s1.Score, (
SELECT COUNT (DISTINCT s2.Score) 
FROM Scores AS s2
WHERE s1.Score <= s2.Score ) AS Rank
FROM Scores AS s1
ORDER BY s1.Score
DESC;

