CREATE TABLE courses(
	course_id INT NOT NULL,
	course_title VARCHAR2(50) NOT NULL,
	PRIMARY KEY (course_id)
);

CREATE TABLE students(
	student_id CHAR(6) NOT NULL,
 	username VARCHAR2(20) NOT NULL,
	name VARCHAR2(20) NOT NULL,
	dob DATE NOT NULL,
	street_address VARCHAR2(50) NOT NULL,
	town VARCHAR2(20) NOT NULL,
	county VARCHAR2(20) NOT NULL,
	phone VARCHAR2(20) NOT NULL,
	student_year CHAR(2) NOT NULL DEFAULT 'JF',
	course_id INT NOT NULL,
	PRIMARY KEY(student_id),
	UNIQUE(username),
	FOREIGN KEY(course_id)
	REFERENCES courses,
	CHECK(student_year IN ('JF','SF','JS','SS')
);

CREATE TABLE modules(
	module_id CHAR(5) NOT NULL,
	module_title VARCHAR2(50) NOT NULL,
	PRIMARY KEY(module_id)
);

CREATE TABLE modules_in_course(
	course_id INT NOT NULL,
	module_id CHAR(5) NOT NULL,
	PRIMARY KEY(course_id, module_id),
	FOREIGN KEY(course_id)
	REFERENCES courses,
	FOREIGN KEY(module_id)
	REFERENCES modules
);

CREATE TABLE lecturers(
	staff_id CHAR(7) NOT NULL,
	name VARCHAR2(20) NOT NULL,
	street_address VARCHAR2(50) NOT NULL,
	town VARCHAR2(20) NOT NULL,
	county VARCHAR2(20) NOT NULL,
	dob DATE,
	phone VARCHAR2(20),
	office_location VARCHAR2(20),
	PRIMARY KEY(staff_id)
);

CREATE TABLE teaching(
	lecturer_id CHAR(7) NOT NULL,
	module_id CHAR(5) NOT NULL,
	PRIMARY KEY(lecturer_id, module_id),
	FOREIGN KEY(lecturer_id)
	REFERENCES lecturers,
	FOREIGN KEY(module_id)
	REFERENCES modules
);

CREATE TABLE classes(
	class_id CHAR(5) NOT NULL,
	start_time DATE NOT NULL,
	day_of_week CHAR(3) NOT NULL,
	location VARCHAR2(20) NOT NULL,
	term CHAR(2) NOT NULL,
	module_id CHAR(5) NOT NULL,
	PRIMARY KEY(class_id),
	FOREIGN KEY(module_id)
	REFERENCES modules
	CHECK(location IN ('LB01','LB04','LB08','LB11')
	CHECK(term IN ('MT', 'HT'))
);
