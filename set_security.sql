CREATE ROLE student;
grant select to student on classes;
grant select to student on modules;
grant execute on show_student_classes;

CREATE ROLE lecturer;
grant select to lecturer on classes;
grant select to lecturer on modules;

CREATE ROLE admin;
grant student to admin;
grant all to admin on staff;
grant all to admin on students;
grant execute on advance_student;
grant all to admin on year_grades;
grant all to admin on students_taking_modules;
grant all to admin on modules;
grant all to admin on classes;
grant all to admin on courses;
grant all to admin on teaching;

CREATE ROLE lecturer0;
grant lecturer to lecturer0;
grant select to lecturer0 on staff_0_classes;

CREATE ROLE lecturer1;
grant lecturer to lecturer1;
grant select to lecturer1 on staff_1_classes;

CREATE ROLE lecturer2;
grant lecturer to lecturer2;
grant select to lecturer2 on staff_2_classes;

CREATE ROLE lecturer3;
grant lecturer to lecturer3;
grant select to lecturer3 on staff_3_classes;

CREATE ROLE lecturer4;
grant lecturer to lecturer4;
grant select to lecturer4 on staff_4_classes;

CREATE ROLE lecturer5;
grant lecturer to lecturer5;
grant select to lecturer5 on staff_5_classes;

CREATE ROLE lecturer6;
grant lecturer to lecturer6;
grant select to lecturer6 on staff_6_classes;

CREATE ROLE lecturer7;
grant lecturer to lecturer7;
grant select to lecturer7 on staff_7_classes;

CREATE ROLE lecturer8;
grant lecturer to lecturer8;
grant select to lecturer8 on staff_8_classes;

CREATE ROLE lecturer9;
grant lecturer to lecturer9;
grant select to lecturer9 on staff_9_classes;
