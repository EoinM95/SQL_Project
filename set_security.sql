CREATE ROLE student;
grant select to student on students;
grant select to student on classes;
grant select to student on modules;


CREATE ROLE lecturer;
grant select to lecturer on staff;
grant select to lecturer on classes;
grant select to lecturer on modules;

CREATE ROLE admin;
grant select to lecturer on staff;
grant select to lecturer on staff_classes;
grant select to lecturer on classes;
grant select to lecturer on modules;
