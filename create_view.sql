CREATE procedure create_student_classes_view(
    student_id in data_type;
)
as
declare
  new_view_name VARCHAR2(40);
begin
  new_view_name :=concat('student_no_',concat(to_char(student_id),' _classes'));
  EXECUTE IMMEDIATE 'CREATE VIEW ' || new_view_name || '
  AS SELECT time,day,location,term, module_id FROM classes,students_taking_modules
    WHERE classes.module_id = students_taking_modules.module_id AND students_taking_modules.student_id = '
    || student_id;
end create_student_classes_view;

CREATE procedure create_staff_classes_view(
    staff_id in data_type;
)
as
declare
  new_view_name VARCHAR2(40);
begin
  new_view_name :=concat('staff_no_',concat(to_char(staff_id),' _classes'));
  EXECUTE IMMEDIATE 'CREATE VIEW ' || new_view_name || '
  AS SELECT time,day,location,term, module_id FROM classes, teaching
      WHERE classes.module_id = teaching.module_id
      AND teaching.staff_id = '  || staff_id;
end create_student_classes_view;



/*CREATE VIEW staff_classes AS SELECT time,day,location,term, module_id FROM classes, teaching
    WHERE classes.module_id = teaching.module_id
    AND teaching.staff_id = 0 ;
*/ 

    /*CREATE VIEW student_classes AS SELECT  time,day,location,term, module_id FROM classes,students_taking_modules
      WHERE classes.module_id = students_taking_modules.module_id AND students_taking_modules.student_id = 0 ;*/
