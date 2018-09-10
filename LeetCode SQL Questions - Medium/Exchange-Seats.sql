626. Exchange Seats

换座位（难度：中等）

seat 座位表，平时用来储存学生名字和与他们相对应的座位 id。
其中纵列的 id 是连续递增的。改变相邻俩学生的座位。（注意：如果学生人数是奇数，则不需要改变最后一个同学的座位）

+---------+---------+
|    id   | student |
+---------+---------+
|    1    | Abbot   |
|    2    | Doris   |
|    3    | Emerson |
|    4    | Green   |
|    5    | Jeames  |
+---------+---------+

假如数据输入的是上表，则输出结果如下：

+---------+---------+
|    id   | student |
+---------+---------+
|    1    | Doris   |
|    2    | Abbot   |
|    3    | Green   |
|    4    | Emerson |
|    5    | Jeames  |
+---------+---------+


Create table seat(id int, student varchar(255));
insert into seat values ('1', 'Abbot');
insert into seat values ('2', 'Doris');
insert into seat values ('3', 'Emerson');
insert into seat values ('4', 'Green');
insert into seat values ('5', 'Jeames');


# Write MySQL query statement below
#方法1: CASE WHEN

SELECT
CASE
# id 为奇数且为最后一个数字，保留 student name
WHEN id%2 = 1 AND id = (SELECT COUNT (*) FROM seat) THEN id
# id 为奇数，跟下一位互换
WHEN id%2 = 1 THEN id + 1
# id 为偶数，跟上一位互换
WHEN id%2 = 0 THEN id - 1
END
AS id, student 
FROM seat 
ORDER BY id


#方法2: 比特位操作 建立互换后的新 id，然后利用 left join + coalesce（）合并空值。

SELECT s1.id, COALESCE(s2.student, s1.student) AS student
FROM seat s1
LEFT JOIN 
seat s2 
ON ((s1.id + 1) ^ 1) - 1 = s2.id
ORDER BY s1.id;


