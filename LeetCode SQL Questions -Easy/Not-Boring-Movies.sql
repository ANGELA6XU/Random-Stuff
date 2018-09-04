620. Not Boring Movies

有趣的电影（难度：简单）

编写一个 SQL查询，找出所有影片描述为非 boring (不无聊) 的并且 id 为奇数 的影片，结果请按等级 rating 排列。

例如，下表 cinema:

+---------+-----------+--------------+-----------+
|   id    | movie     |  description |  rating   |
+---------+-----------+--------------+-----------+
|   1     | War       |   great 3D   |   8.9     |
|   2     | Science   |   fiction    |   8.5     |
|   3     | irish     |   boring     |   6.2     |
|   4     | Ice song  |   Fantacy    |   8.6     |
|   5     | House card|   Interesting|   9.1     |
+---------+-----------+--------------+-----------+

对于上面的例子，则正确的输出是为：

+---------+-----------+--------------+-----------+
|   id    | movie     |  description |  rating   |
+---------+-----------+--------------+-----------+
|   5     | House card|   Interesting|   9.1     |
|   1     | War       |   great 3D   |   8.9     |
+---------+-----------+--------------+-----------+


Create table cinema (id int, movie varchar(255), description varchar(255), rating float(2, 1));
insert into cinema values ('1', 'War', 'great 3D', '8.9');
insert into cinema values ('2', 'Science', 'fiction', '8.5');
insert into cinema values ('3', 'irish', 'boring', '6.2');
insert into cinema values ('4', 'Ice song', 'Fantacy', '8.6');
insert into cinema values ('5', 'House card', 'Interesting', '9.1');


# Write MySQL query statement below
SELECT id, movie, description, rating
FROM cinema
WHERE description <> 'boring'
AND
MOD(id, 2) = 1
ORDER BY
rating DESC;
