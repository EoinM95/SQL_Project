CREATE OR REPLACE TRIGGER check_graduated AFTER
UPDATE OF year ON students
BEGIN
  DELETE * FROM students WHERE year = 'SS'
END;
/
