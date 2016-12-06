CREATE VIEW student_classes AS SELECT  time,day,location,term, classes.module_id, modules.module_name FROM classes, modules, students
  WHERE classes.module_id = modules.module_id AND students.course_id = modules.course_id
  AND modules.course_id = courses.course_id AND students.student_id = 0 ;

CREATE VIEW staff_classes AS SELECT time,day,location,term, classes.module_id, modules.module_name FROM classes, modules, teaching
    WHERE classes.module_id = modules.module_id AND teaching.module_id = modules.module_id
    AND teaching.staff_id = 0 ;
