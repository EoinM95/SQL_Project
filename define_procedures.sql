/*
	Checked and working
*/

CREATE OR REPLACE PROCEDURE advance_student(id NUMBER, year_code CHAR)
AS
	next_year students.current_year%TYPE;
	update_statement VARCHAR(500);
BEGIN
    CASE year_code
      WHEN 'JF' THEN next_year := 'SF';
      WHEN 'SF' THEN next_year := 'JS';
      WHEN 'JS' THEN next_year := 'SS';
	  ELSE next_year := year_code ;
    END CASE;
		update_statement := 'UPDATE students SET current_year = :1 WHERE student_id = :2';
    EXECUTE IMMEDIATE update_statement using next_year, id;
END advance_student;
/
show errors;

CREATE OR REPLACE procedure show_student_classes(
    student_id students.student_id%TYPE
)
as
  show_classes VARCHAR2(400);
	TYPE CURSOR_TYPE IS REF CURSOR;
  classes_cursor CURSOR_TYPE;
begin
  show_classes := 'SELECT  start_time,day_of_week,location,term, classes.module_id
		FROM classes,students_taking_modules
     	WHERE classes.module_id = students_taking_modules.module_id
		AND students_taking_modules.student_id = :1';
  OPEN classes_cursor FOR show_classes using student_id;
	loop
	    fetch class_record into start_time,day_of_week,location,term, module_id;
			exit when class_record%NOTFOUND;
			dbms_output.putline('start_time ' || start_time || ' day_of_week ' || day_of_week || ' location ' || location || ' term ' || term || ' module_id ' || module_id);
	end loop;
	close classes_cursor;
end show_student_classes;
/
show errors;
