alter table teachers
add phone int;

CREATE TABLE IF NOT EXISTS students_courses
(
    student_id integer NOT NULL,
    course_id integer NOT NULL,
    CONSTRAINT course_fk FOREIGN KEY (course_id)
        REFERENCES Courses (Course_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT student_fk FOREIGN KEY (student_id)
        REFERENCES Students (Student_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);