alter table teachers
add phone VARCHAR;

CREATE TABLE IF NOT EXISTS students_courses
(
    student_id INT NOT NULL,
    course_id INT,
    CONSTRAINT std_crs_pk PRIMARY KEY (student_id,course_id),
    CONSTRAINT course_fk FOREIGN KEY (course_id)
        REFERENCES courses (Course_id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT student_fk FOREIGN KEY (student_id)
        REFERENCES students (student_id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
);