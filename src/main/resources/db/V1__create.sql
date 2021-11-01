
CREATE TABLE students
(
    student_id SERIAL NOT NULL,
    first_Name VARCHAR(40) NOT NULL,
    last_name VARCHAR(40) NOT NULL,
    registration_year timestamp,
    CONSTRAINT students_pkey PRIMARY KEY (student_id)
);

CREATE TABLE teachers
(
    teacher_id SERIAL NOT NULL,
    Name varchar(30) NOT NULL,
    Surname varchar(30) NOT NULL,
    mail varchar(50),
    CONSTRAINT Teachers_pkey PRIMARY KEY (teacher_id)
);

CREATE TABLE courses
(
    Course_id SERIAL NOT NULL,
    Topic varchar(40) NOT NULL,
    CONSTRAINT Course_pk PRIMARY KEY (Course_id)
);

CREATE TABLE schedule
(
    course_id int NOT NULL,
    teacher_id int NOT NULL,
    "time" timestamp with time zone NOT NULL,
    lesson_id integer NOT NULL,
    CONSTRAINT lesson_pk PRIMARY KEY (lesson_id),
    CONSTRAINT schedule_course_fk FOREIGN KEY (course_id)
        REFERENCES courses (Course_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT schedule_teacher_fk FOREIGN KEY (teacher_id)
        REFERENCES Teachers (teacher_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);

CREATE TABLE IF NOT EXISTS Homeworks
(
    homework_id int NOT NULL,
    lesson_id int NOT NULL,
    homework_details varchar(100),
    CONSTRAINT homework_pk PRIMARY KEY (homework_id),
    CONSTRAINT homework_lesson_fk FOREIGN KEY (lesson_id)
        REFERENCES schedule (lesson_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);

CREATE TABLE IF NOT EXISTS student_course_details
(
    student_id integer NOT NULL,
    lesson_id integer NOT NULL,
    grade integer,
    attend boolean NOT NULL,
    CONSTRAINT std_crs_dtl_lesson_id FOREIGN KEY (lesson_id)
        REFERENCES schedule (lesson_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT std_crs_dtl_std_id FOREIGN KEY (student_id)
        REFERENCES Students (Student_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);

