CREATE type array as table of NUMBER;

CREATE OR REPLACE PROCEDURE advance_students(ids IN array)
AS
DECLARE
  next_id NUMBER;
  current_year CHAR(2);
  next_year CHAR(2);
BEGIN
  for i in 1..ids.count loop
    next_id := ids(i)
    SELECT year INTO current_year
    FROM students
    WHERE student_id = next_id;

    CASE current_year
      WHEN current_year = 'JF' THEN next_year = 'SF';
      WHEN current_year = 'SF' THEN next_year = 'JS'
      WHEN current_year = 'JS' THEN next_year = 'SS'
    ELSE next_year = current_year ;
    END CASE;
    UPDATE students SET year to next_year WHERE student_id = next_id ;
  END loop;
END;
/

/*CREATE OR REPLACE PROCEDURE add_grades()*/
