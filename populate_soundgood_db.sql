INSERT INTO person (first_name,last_name,person_number)
VALUES
  ('Colt','Mullen','32.347.625-K'),
  ('Kirestin','Harris','28.530.301-K'),
  ('Adam','Solis','23.109.378-8'),
  ('Cadman','Ross','8.702.869-0'),
  ('Rosalyn','Carlson','6.840.533-5'),
  ('Louis','Sargent','1.780.337-9'),
  ('Colorado','Sims','45.530.804-6'),
  ('Beatrice','Mcintosh','28.558.971-1'),
  ('Octavia','House','29.152.177-0'),
  ('Aline','Stout','8.380.606-0'),
  ('Chester','Brown','32.659.774-0'),
  ('Emerald','Moses','47.701.827-0'),
  ('Castor','Nunez','107.732-5'),
  ('Kirestin','Delaney','854.809-9'),
  ('Lillian','Burt','20.236.447-0');

INSERT INTO address (person_id,zip_code,city,street_name)
VALUES
  (1,'62753','Gävle','P.O. Box 769, 1241 Nisi. Road'),
  (2,'11611','Avesta','Ap #985-5232 Tortor Ave'),
  (3,'22501','Åkersberga','P.O. Box 453, 8296 Consequat Ave'),
  (4,'38681','Avesta','200-7636 Interdum. Road'),
  (5,'33768','Nässjö','Ap #282-4750 Nec Ave'),
  (6,'48268','Borlänge','Ap #186-3395 Vulputate Rd.'),
  (7,'27013','Avesta','Ap #320-4028 Massa. Av.'),
  (8,'07074','Finspång','Ap #116-2851 Tellus. Ave'),
  (9,'97534','Åkersberga','P.O. Box 351, 7608 Eu Street'),
  (10,'84818','Åkersberga','Ap #768-5648 Elit, Road'),
  (11,'75233','Motala','P.O. Box 566, 2966 At Ave'),
  (12,'81573','Borås','Ap #422-1672 Vulputate, Av.'),
  (13,'42112','Boo','Ap #178-1590 Aenean Ave'),
  (14,'83690','Kungälv','P.O. Box 871, 3948 Tellus Avenue'),
  (15,'45140','Tranås','Ap #142-7548 Ut, Street');

INSERT INTO contact_details (person_id,email)
VALUES
  (1,'at@yahoo.ca'),
  (2,'nulla.in.tincidunt@icloud.net'),
  (3,'sem.molestie@yahoo.couk'),
  (4,'a.nunc.in@hotmail.edu'),
  (5,'donec@yahoo.net'),
  (6,'tincidunt.orci@hotmail.org'),
  (7,'ornare@outlook.edu'),
  (8,'elit.aliquam@outlook.edu'),
  (9,'felis.ullamcorper.viverra@yahoo.net'),
  (10,'rutrum@outlook.com'),
  (11,'porttitor.eros@icloud.org'),
  (12,'lacus.aliquam@protonmail.com'),
  (13,'lacus.varius@google.edu'),
  (14,'fusce.dolor.quam@outlook.edu'),
  (15,'porttitor.tellus.non@icloud.couk');

  INSERT INTO contact_details_phone_number (contact_details_id,phone_number)
VALUES
  (1,'075 863 52 13'),
  (2,'075 421 48 63'),
  (3,'077 148 65 35'),
  (4,'076 182 21 68'),
  (5,'078 871 17 54'),
  (6,'073 455 22 55'),
  (7,'073 691 82 65'),
  (8,'072 724 27 67'),
  (9,'075 543 30 93'),
  (10,'072 472 24 15'),
  (11,'075 636 78 84'),
  (12,'077 429 83 67'),
  (13,'074 649 64 11'),
  (14,'071 511 14 27'),
  (15,'072 601 92 85');

INSERT INTO contact_person (id)
VALUES
  (1),
  (2);

INSERT INTO student (id, contact_person_id)
VALUES
  (3, NULL),
  (4, NULL),
  (5, NULL),
  (6, 1),
  (7, 1),
  (8, 2),
  (9, 2),
  (10, 2);

INSERT INTO student_sibling (student_id, sibling_student_id)
VALUES
  (6, 7),
  (8, 9),
  (8, 10),
  (9, 10);

INSERT INTO instructor (id)
VALUES
  (11),
  (12),
  (13),
  (14),
  (15);

INSERT INTO cost (instructor_id,private_lesson_price,group_lesson_price,ensemble_price)
VALUES
  (11,200,100,300),
  (12,250,150,350),
  (13,300,200,400),
  (14,350,250,450),
  (15,400,300,500);

INSERT INTO teachable_ensemble_genres (instructor_id,genre)
VALUES
  (11,'lacus'),
  (12,'nec'),
  (13,'ullamcorper'),
  (14,'lorem'),
  (15,'Pellentesque');

INSERT INTO instrument (type,stock_for_instrument)
VALUES
  ('risus',8),
  ('Duis',7),
  ('nec',6),
  ('congue',9),
  ('orci',2);

INSERT INTO instructor_instrument (instructor_id,instrument_id)
VALUES
  (11,1),
  (12,2),
  (13,3),
  (14,4),
  (15,5);

INSERT INTO rent_instrument (student_id,instrument_id,date_of_rent,date_of_return,cost,transaction_number)
VALUES
  (6,1,'May 18, 2022','May 18, 2024',72,73856),
  (7,2,'Jan 22, 2022','Jan 22, 2024',35,89359),
  (8,3,'Feb 15, 2022','Feb 15, 2024',46,50028),
  (9,4,'Feb 17, 2022','Feb 17, 2024',65,99315),
  (10,5,'May 19, 2022','May 19, 2024',95,44539);

INSERT INTO lesson (date_and_time,discount,type,instructor_id)
VALUES
  ('June 8, 2023',50,'private_lesson',13),
  ('May 30, 2023',50,'ensemble',15),
  ('Oct 17, 2023',50,'group_lesson',13),
  ('Jun 10, 2023',50,'group_lesson',15),
  ('May 12, 2023',50,'ensemble',12),
  ('Aug 3, 2023',50,'private_lesson',14),
  ('Dec 9, 2022',50,'private_lesson',14),
  ('Feb 2, 2023',50,'group_lesson',12),
  ('May 26, 2023',50,'group_lesson',12),
  ('Jan 18, 2023',50,'ensemble',12),
  ('Jan 16, 2023',50,'ensemble',11),
  ('Oct 22, 2023',50,'private_lesson',14),
  ('Aug 8, 2023',50,'private_lesson',11),
  ('Oct 21, 2023',50,'group_lesson',13),
  ('Jan 16, 2023',50,'ensemble',13);

INSERT INTO student_lesson (student_id,lesson_id)
VALUES
  (4,15),
  (5,15),
  (6,1),
  (7,4),
  (8,6),
  (9,8),
  (10,11);

INSERT INTO private_lesson (id,instrument_id,level)
VALUES
  (1,1,'intermediate'),
  (6,2,'advanced'),
  (7,5,'beginner'),
  (12,3,'beginner'),
  (13,4,'intermediate');

INSERT INTO group_lesson (id,instrument_id,level,min_persons,max_persons)
VALUES
  (3,1,'intermediate',3,11),
  (4,2,'intermediate',5,13),
  (8,3,'beginner',5,16),
  (9,4,'advanced',3,20),
  (14,5,'intermediate',3,16);

INSERT INTO ensemble (id,genre,min_persons,max_persons)
VALUES
  (2,'rutrum',2,10),
  (5,'mollis',3,13),
  (10,'sapien',2,15),
  (11,'eget',1,2),
  (15,'dui',4,2);
