
CREATE TABLE courses(
	course_id NUMBER NOT NULL,
	course_title VARCHAR2(50) NOT NULL,
	PRIMARY KEY (course_id)
);

CREATE TABLE students(
	student_id NUMBER NOT NULL,
 	username VARCHAR2(20) NOT NULL,
	name VARCHAR2(20) NOT NULL,
	dob DATE NOT NULL,
	street_address VARCHAR2(50) NOT NULL,
	town VARCHAR2(20) NOT NULL,
	county VARCHAR2(20) NOT NULL,
	phone VARCHAR2(20) NOT NULL,
	current_year CHAR(2) DEFAULT 'JF',
	course_id NUMBER NOT NULL,
	PRIMARY KEY(student_id),
	UNIQUE(username),
	FOREIGN KEY(course_id)
	REFERENCES courses,
	CHECK(current_year IN ('JF','SF','JS','SS'))
);

CREATE TABLE modules(
	module_id CHAR(5) NOT NULL,
	module_title VARCHAR2(50) NOT NULL,
	PRIMARY KEY(module_id)
);

CREATE TABLE students_taking_modules(
	module_id CHAR(5) NOT NULL,
	student_id NUMBER NOT NULL,
	grade NUMBER,
	PRIMARY KEY(student_id,module_id),
	FOREIGN KEY(student_id)
	REFERENCES students,
	FOREIGN KEY(module_id)
	REFERENCES modules,
	CHECK(grade >= 0 AND grade <= 100)
);

CREATE TABLE year_grades(
	student_id NUMBER NOT NULL,
	year_code CHAR(2) NOT NULL,
	grade NUMBER,
	PRIMARY KEY(student_id, year_code),
	FOREIGN KEY(student_id)
	REFERENCES students,
	CHECK(year_code IN ('JF','SF','JS','SS'))
);

CREATE TABLE staff(
	staff_id NUMBER NOT NULL,
	username VARCHAR2(20) NOT NULL,
	name VARCHAR2(20) NOT NULL,
	dob DATE,
	street_address VARCHAR2(50) NOT NULL,
	town VARCHAR2(20) NOT NULL,
	county VARCHAR2(20) NOT NULL,
	phone VARCHAR2(20),
	PRIMARY KEY(staff_id),
	UNIQUE(username)
);

CREATE TABLE teaching(
	staff_id NUMBER NOT NULL,
	module_id CHAR(5) NOT NULL,
	PRIMARY KEY(staff_id, module_id),
	FOREIGN KEY(staff_id)
	REFERENCES staff,
	FOREIGN KEY(module_id)
	REFERENCES modules
);

CREATE TABLE classes(
	class_id NUMBER NOT NULL,
	start_time CHAR(5) NOT NULL,
	day_of_week CHAR(3) NOT NULL,
	location VARCHAR2(20) NOT NULL,
	term CHAR(2) NOT NULL,
	module_id CHAR(5) NOT NULL,
	PRIMARY KEY(class_id),
	FOREIGN KEY(module_id)
	REFERENCES modules,
	CHECK(location IN ('LB01','LB04','LB08','LB11')),
	CHECK(term IN ('MT', 'HT'))
);
