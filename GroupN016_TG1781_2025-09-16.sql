CREATE USER 'lecturer'@'localhost' IDENTIFIED BY 'lecturer1';
GRANT ALL PRIVILEGES ON Faculty_Of_Technology.* TO 'lecturer'@'localhost';
FLUSH PRIVILEGES;