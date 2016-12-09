CREATE OR REPLACE procedure create_student_classes_view(
    student_id NUMBER
)
as
  new_view_name VARCHAR2(30);
  create_view VARCHAR2(400);
begin
  new_view_name :='student_classes';
  dbms_output.put_line(new_view_name);
  dbms_output.put_line('View name should be above');
  create_view := 'CREATE VIEW student_classes AS 
		SELECT  start_time,day_of_week,location,term, classes.module_id 
		FROM classes,students_taking_modules
     	WHERE classes.module_id = students_taking_modules.module_id 
		AND students_taking_modules.student_id = :1';
  EXECUTE IMMEDIATE create_view using student_id;
end create_student_classes_view;
/
show errors;
CREATE OR REPLACE procedure create_staff_classes_view(
    staff_id NUMBER
)
as
  new_view_name VARCHAR2(40);
begin
  new_view_name :=concat('staff_no_',concat(to_char(staff_id),' _classes'));
  EXECUTE IMMEDIATE 'CREATE VIEW ' || new_view_name || '
  AS SELECT start_time,day_of_week,location,term, module_id FROM classes, teaching
      WHERE classes.module_id = teaching.module_id
      AND teaching.staff_id = '  || staff_id;
end create_staff_classes_view;
/
show errors;