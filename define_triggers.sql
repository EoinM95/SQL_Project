CREATE OR REPLACE TRIGGER check_can_add_year_grade AFTER
INSERT OR UPDATE OF grade ON students_taking_modules
FOR EACH ROW
DECLARE
  id students.student_id%TYPE;
  no_of_modules NUMBER;
  sum_of_grades NUMBER;
  final_grade NUMBER;
  null_values NUMBER;
  current_year students.current_year%TYPE;
  check_nulls VARCHAR2(200);
  create_cursor VARCHAR2(200);
  query_result students_taking_modules%ROWTYPE;
  TYPE CURSOR_TYPE IS REF CURSOR;
  student_cursor CURSOR_TYPE;
  select_current_year VARCHAR2(200);
  insert_year_grade VARCHAR2(200);
BEGIN
  id := :NEW.student_id;
  no_of_modules := 0;
  check_nulls := 'SELECT count(*)
  from students_taking_modules where student_id = :id
  AND grade IS NULL';
  EXECUTE IMMEDIATE check_nulls INTO null_values USING id;
  if null_values = 0
  then
    OPEN student_cursor FOR 'SELECT * from students_taking_modules
      where :id = students_taking_modules.student_id'
      USING id;
    loop
        fetch student_cursor into query_result;
        exit when student_cursor%NOTFOUND;
        no_of_modules := no_of_modules + 1;
        sum_of_grades := query_result.grade + sum_of_grades;
    end loop;
    close student_cursor;
    final_grade := sum_of_grades/no_of_modules;
    select_current_year := 'SELECT year
    FROM students
    WHERE student_id = :id';
    EXECUTE IMMEDIATE select_current_year  INTO current_year USING id;
    insert_year_grade := 'INSERT into year_grades VALUES (:id, :year, :grade)';
    EXECUTE IMMEDIATE insert_year_grade using id, current_year, final_grade;
    if final_grade >= 40 then advance_student(id, current_year); end if;
  end if;
END;
run;
/
show errors;

CREATE OR REPLACE TRIGGER check_graduated AFTER
UPDATE OF current_year ON students
BEGIN
  DELETE FROM students WHERE current_year = 'GR';
END;
run;
/
show errors;
