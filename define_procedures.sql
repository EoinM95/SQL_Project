/*
	Checked and working
*/

CREATE OR REPLACE PROCEDURE advance_student(id NUMBER, year_code CHAR)
AS
	next_year CHAR(2);
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