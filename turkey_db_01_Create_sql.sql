-- create and select the database
DROP DATABASE IF EXISTS turkey_db;
CREATE DATABASE turkey_db;
flush privileges;
USE turkey_db;
-- create a user and grant CRUD privileges to that user
DROP USER IF EXISTS turkey_user@localhost;
CREATE USER turkey_user@localhost IDENTIFIED BY 'sesame';
GRANT SELECT, INSERT, DELETE, UPDATE ON turkey_db.* TO turkey_user@localhost;

-- create admin user and grant CRUD & CREATE privileges to that user
DROP USER IF EXISTS turkey_adm@localhost;
CREATE USER turkey_adm@localhost IDENTIFIED BY 'sesame';
GRANT ALL PRIVILEGES ON turkey_db.* TO turkey_adm@localhost;


