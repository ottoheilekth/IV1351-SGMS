CREATE TABLE "person"
(
    "id" int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "first_name" varchar(100) NOT NULL,
    "last_name" varchar(100) NOT NULL,
    "person_number" varchar(12) UNIQUE NOT NULL
);

CREATE TABLE "address"
(
    "person_id" int NOT NULL REFERENCES "person" PRIMARY KEY,
    "zip_code" varchar(10) NOT NULL,
    "city" varchar(200) NOT NULL,
    "street_name" varchar(200) NOT NULL
);

CREATE TABLE "contact_details"
(
    "person_id" int NOT NULL REFERENCES "person" PRIMARY KEY,
    "email" varchar(100) UNIQUE NOT NULL
);

CREATE TABLE "contact_details_phone_number"
(
    "contact_details_id" int NOT NULL REFERENCES "contact_details" PRIMARY KEY,
    "phone_number" varchar(100) UNIQUE NOT NULL
);

CREATE TABLE "contact_person"
(
    "id" int NOT NULL REFERENCES "person" PRIMARY KEY
);

CREATE TABLE "student"
(
    "id" int NOT NULL REFERENCES "person" PRIMARY KEY,
    "contact_person_id" int REFERENCES "contact_person"
);

CREATE TABLE "student_sibling"
(
    "student_id" int NOT NULL REFERENCES "student",
    "sibling_student_id" int NOT NULL REFERENCES "student",
    PRIMARY KEY("student_id", "sibling_student_id")
);

CREATE TABLE "instructor"
(
    "id" int NOT NULL REFERENCES "person" PRIMARY KEY
);

CREATE TYPE lessontype AS ENUM ('private_lesson', 'group_lesson', 'ensemble');

CREATE TABLE "cost"
(
    "instructor_id" int NOT NULL REFERENCES "instructor" ON DELETE CASCADE PRIMARY KEY,
    "private_lesson_price" int NOT NULL,
    "group_lesson_price" int NOT NULL,
    "ensemble_price" int NOT NULL
);

CREATE TABLE "teachable_ensemble_genres"
(
    "instructor_id" int NOT NULL REFERENCES "instructor" PRIMARY KEY,
    "genre" varchar(100)
);

CREATE TABLE "instrument"
(
    "id" int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "type" varchar(100) NOT NULL,
    "stock_for_instrument" int NOT NULL
);

CREATE TABLE "instructor_instrument"
(
    "instructor_id" int NOT NULL REFERENCES "instructor" ON DELETE CASCADE,
    "instrument_id" int NOT NULL REFERENCES "instrument" ON DELETE CASCADE,
    PRIMARY KEY("instructor_id", "instrument_id")
);

CREATE TABLE "rent_instrument"
(
    "student_id" int NOT NULL REFERENCES "student" ON DELETE CASCADE,
    "instrument_id" int NOT NULL REFERENCES "instrument" ON DELETE CASCADE,
    "date_of_rent" date NOT NULL,
    "date_of_return" date NOT NULL,
    "cost" int NOT NULL,
    "transaction_number" int UNIQUE NOT NULL,
    PRIMARY KEY("student_id", "instrument_id")
);

CREATE TABLE "lesson"
(
    "id" int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "date_and_time" date NOT NULL,
    "discount" int NOT NULL,
    "type" lessontype NOT NULL,
    "instructor_id" int NOT NULL REFERENCES "instructor"
);

CREATE TABLE "student_lesson"
(
    "student_id" int NOT NULL REFERENCES "student" ON DELETE CASCADE,
    "lesson_id" int NOT NULL REFERENCES "lesson" ON DELETE CASCADE,
    PRIMARY KEY("student_id", "lesson_id")
);

CREATE TYPE lessonlevel AS ENUM ('beginner', 'intermediate', 'advanced');

CREATE TABLE "private_lesson"
(
    "id" int NOT NULL REFERENCES "lesson" ON DELETE CASCADE,
    "instrument_id" int NOT NULL REFERENCES "instrument" ON DELETE CASCADE,
    "level" lessonlevel NOT NULL,
    PRIMARY KEY("id", "instrument_id")
);

CREATE TABLE "group_lesson"
(
    "id" int NOT NULL REFERENCES "lesson" ON DELETE CASCADE,
    "instrument_id" int NOT NULL REFERENCES "instrument" ON DELETE CASCADE,
    "level" lessonlevel NOT NULL,
    "min_persons" int NOT NULL,
    "max_persons" int NOT NULL,
    PRIMARY KEY("id", "instrument_id")
);

CREATE TABLE "ensemble"
(
    "id" int NOT NULL REFERENCES "lesson" ON DELETE CASCADE PRIMARY KEY,
    "genre" varchar(100) NOT NULL,
    "min_persons" int NOT NULL,
    "max_persons" int NOT NULL
);
