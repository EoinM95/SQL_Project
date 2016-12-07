CREATE OR REPLACE TRIGGER check_can_add_year_grade AFTER
INSERT OR UPDATE OF GRADES ON students_taking_modules
BEGIN
  


CREATE OR REPLACE TRIGGER check_graduated AFTER
UPDATE OF year ON students
BEGIN
  DELETE * FROM students WHERE year = 'SS'
END;
/
