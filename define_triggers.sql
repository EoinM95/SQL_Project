CREATE OR REPLACE TRIGGER check_can_add_year_grade AFTER
INSERT OR UPDATE OF GRADES ON students_taking_modules
FOR EACH ROW
DECLARE
  id NUMBER;
  no_of_modules NUMBER;
  sum_of_grades NUMBER;
  final_grade NUMBER;
  null_values NUMBER;
  current_year CHAR(2);
BEGIN
  student_id := NEW.student_id;
  no_of_modules := 0;
  SELECT count(*) into null_values
  from students_taking_modules where id = students_taking_modules.student_id
  AND grade IS NULL;
  if null_values = 0
  then
    for query_result IN (SELECT * from students_taking_modules
      where id = students_taking_modules.student_id) loop
        number_of_modules := number_of_modules + 1;
        sum_of_grades := query_result.grade + sum_of_grades;
      end loop;
      final_grade := sum_of_grades/number_of_modules;
      SELECT year INTO current_year
      FROM students
      WHERE id = next_id;
      INSERT into year_grades VALUES (id, current_year, final_grade);
      if final_grade >= 40 then advance_student(id) end if;
  end if;
END;
/

CREATE OR REPLACE TRIGGER check_graduated AFTER
UPDATE OF year ON students
BEGIN
  DELETE * FROM students WHERE year = 'SS'
END;
/
