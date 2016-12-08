CREATE type array as table of NUMBER;

CREATE OR REPLACE PROCEDURE advance_students(id, current_year)
AS
DECLARE
  next_year CHAR(2);
BEGIN
    SELECT year INTO current_year
    FROM students
    WHERE id = next_id;

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
