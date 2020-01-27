CREATE USER 'unidemo'@'localhost' IDENTIFIED BY 'unidemo';

GRANT ALL PRIVILEGES ON * . * TO 'unidemo'@'localhost';

ALTER USER 'unidemo'@'localhost' IDENTIFIED WITH mysql_native_password BY 'unidemo';