CREATE VIEW staff_0_classes AS
SELECT start_time,day_of_week,location,term, classes.module_id
FROM classes, teaching
WHERE classes.module_id = teaching.module_id
AND teaching.staff_id = 0;


CREATE VIEW staff_1_classes AS
SELECT start_time,day_of_week,location,term, classes.module_id
FROM classes, teaching
WHERE classes.module_id = teaching.module_id
AND teaching.staff_id = 1;


CREATE VIEW staff_2_classes AS
SELECT start_time,day_of_week,location,term, classes.module_id
FROM classes, teaching
WHERE classes.module_id = teaching.module_id
AND teaching.staff_id = 2;

CREATE VIEW staff_3_classes AS
SELECT start_time,day_of_week,location,term, classes.module_id
FROM classes, teaching
WHERE classes.module_id = teaching.module_id
AND teaching.staff_id = 3;


CREATE VIEW staff_4_classes AS
SELECT start_time,day_of_week,location,term, classes.module_id
FROM classes, teaching
WHERE classes.module_id = teaching.module_id
AND teaching.staff_id = 4;

CREATE VIEW staff_5_classes AS
SELECT start_time,day_of_week,location,term, classes.module_id
FROM classes, teaching
WHERE classes.module_id = teaching.module_id
AND teaching.staff_id = 5;

CREATE VIEW staff_6_classes AS
SELECT start_time,day_of_week,location,term, classes.module_id
FROM classes, teaching
WHERE classes.module_id = teaching.module_id
AND teaching.staff_id = 6;

CREATE VIEW staff_7_classes AS
SELECT start_time,day_of_week,location,term, classes.module_id
FROM classes, teaching
WHERE classes.module_id = teaching.module_id
AND teaching.staff_id = 7;

CREATE VIEW staff_8_classes AS
SELECT start_time,day_of_week,location,term, classes.module_id
FROM classes, teaching
WHERE classes.module_id = teaching.module_id
AND teaching.staff_id = 8;

CREATE VIEW staff_9_classes AS
SELECT start_time,day_of_week,location,term, classes.module_id
FROM classes, teaching
WHERE classes.module_id = teaching.module_id
AND teaching.staff_id = 9;
