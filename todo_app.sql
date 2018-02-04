DROP DATABASE IF EXISTS todo_app;

DROP USER IF EXISTS michael;

CREATE ROLE michael with ENCRYPTED PASSWORD 'stonebreaker';

CREATE DATABASE todo_app;

\c todo_app;

CREATE TABLE tasks (
  id SERIAL NOT NULL,
  title varchar(255) NOT NULL,
  description text,
  created_at timestamp without time zone default now() NOT NULL,
  updated_at timestamp without time zone,
  completed boolean NOT NULL default false
);

ALTER TABLE tasks 
  ADD PRIMARY KEY (id);

ALTER TABLE tasks
  DROP COLUMN completed;

ALTER TABLE tasks
  ADD COLUMN completed_at timestamp default NULL;

ALTER TABLE tasks 
  ALTER COLUMN updated_at SET NOT NULL, 
  ALTER COLUMN updated_at SET default now();

INSERT INTO tasks
  VALUES (DEFAULT, 'Study SQL', 'Complete this exercise', now(), now(), DEFAULT);

INSERT INTO tasks(title, description)
  VALUES ('Study PostgreSQL', 'Read all the documentation');

SELECT title FROM tasks WHERE completed_at is NULL;

UPDATE tasks SET completed_at = now() WHERE title = 'Study SQL';

SELECT title, description FROM tasks WHERE completed_at is NULL;

SELECT * FROM tasks ORDER BY created_at DESC;

INSERT INTO tasks(title, description) 
  VALUES ('mistake 1', 'a test entry');

INSERT INTO tasks(title, description) 
  VALUES ('mistake 2', 'another test entry');

INSERT INTO tasks(title, description) 
  VALUES ('third mistake', 'another test entry');

SELECT title FROM tasks WHERE title LIKE '%mistake%';

DELETE FROM tasks where title = 'mistake 1';

SELECT title, description FROM tasks WHERE title LIKE '%mistake%';

DELETE FROM tasks WHERE title LIKE '%mistake%';

SELECT * FROM tasks ORDER BY title ASC;