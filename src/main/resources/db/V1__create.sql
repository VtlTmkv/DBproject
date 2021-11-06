--Задание вариант 1

CREATE TABLE academic_group
(
    group_id SERIAL NOT NULL,
    number VARCHAR NOT NULL,
    CONSTRAINT academic_group_pk PRIMARY KEY (group_id)
);


CREATE TABLE students
(
    student_id SERIAL NOT NULL,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    registration_year TIMESTAMP,
    group_id int,
    CONSTRAINT students_pk PRIMARY KEY (student_id),
    CONSTRAINT group_id_fk FOREIGN KEY (group_id)
        REFERENCES academic_group(group_id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE teachers
(
    teacher_id SERIAL NOT NULL,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    mail VARCHAR,
    CONSTRAINT teachers_pk PRIMARY KEY (teacher_id)
);

CREATE TABLE courses
(
    course_id SERIAL NOT NULL,
    name VARCHAR NOT NULL,
    topic VARCHAR NOT NULL,
    CONSTRAINT course_pk PRIMARY KEY (course_id)
);


CREATE TABLE lessons
(
    lesson_id SERIAL NOT NULL,
    course_id INT NOT NULL,
    teacher_id INT,
    start_time TIMESTAMP NOT NULL,
    end_time TIMESTAMP NOT NULL,
    CONSTRAINT lesson_pk PRIMARY KEY (lesson_id),
    CONSTRAINT schedule_course_fk FOREIGN KEY (course_id)
        REFERENCES courses (course_id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT schedule_teacher_fk FOREIGN KEY (teacher_id)
        REFERENCES teachers (teacher_id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE attends_lessons
(
    lesson_id INT NOT NULL,
    student_id INT NOT NULL,
    CONSTRAINT attends_lessons_pk PRIMARY KEY (lesson_id,student_id),
    CONSTRAINT atd_lsn_lsn_fk FOREIGN KEY (lesson_id)
        REFERENCES lessons (lesson_id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT atd_lsn_std_fk FOREIGN KEY (student_id)
         REFERENCES students (student_id) MATCH SIMPLE
         ON UPDATE CASCADE
         ON DELETE CASCADE
);


CREATE TABLE homeworks
(
    homework_id SERIAL NOT NULL,
    homework_details VARCHAR,
    CONSTRAINT homework_pk PRIMARY KEY (homework_id)
);

CREATE TABLE lesson_homework
(
    lesson_id iNT NOT NULL,
    homework_id INT,
    CONSTRAINT lsn_hwk_pk PRIMARY KEY (lesson_id, homework_id),
    CONSTRAINT lesson_id_fk FOREIGN KEY (lesson_id)
        REFERENCES lessons(lesson_id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT homework_id_fk FOREIGN KEY (homework_id)
        REFERENCES homeworks (homework_id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE

);

CREATE TABLE IF NOT EXISTS student_course_details
(
    group_id INT NOT NULL,
    lesson_id INT NOT NULL,
    grade INT,
    CONSTRAINT std_crs_dtl_pk PRIMARY KEY (group_id,lesson_id),
    CONSTRAINT std_crs_dtl_lesson_id FOREIGN KEY (lesson_id)
        REFERENCES lessons (lesson_id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT std_crs_dtl_grp_id FOREIGN KEY (group_id)
        REFERENCES academic_group (group_id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

