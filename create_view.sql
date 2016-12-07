CREATE VIEW student_classes AS SELECT  time,day,location,term, module_id FROM classes,students_taking_modules
  WHERE classes.module_id = students_taking_modules.module_id AND students_taking_modules.student_id = 0 ;

CREATE VIEW staff_classes AS SELECT time,day,location,term, module_id FROM classes, teaching
    WHERE classes.module_id = teaching.module_id
    AND teaching.staff_id = 0 ;
