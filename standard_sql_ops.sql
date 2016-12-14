SELECT * from students_taking_modules INNER JOIN modules
ON students_taking_modules.module_id = modules.module_id;

SELECT * from students_taking_modules, modules
WHERE students_taking_modules.module_id = modules.module_id
AND students_taking_modules.student_id = 0;

SELECT name, modules.module_title from staff,teaching, modules WHERE
staff.staff_id = teaching.staff_id AND modules.module_id = teaching.module_id;
