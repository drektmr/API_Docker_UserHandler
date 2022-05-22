/*Fichero destinado a la creación del usuario con el que trabajaremos en la aplicación otorgandole todos los permisos*/
CREATE USER 'melomany'@'%' IDENTIFIED BY 'thos';
REVOKE ALL PRIVILEGES ON *.* FROM 'melomany'@'%'; GRANT ALL PRIVILEGES ON *.* TO 'melomany'@'%'; ALTER USER 'melomany'@'%' REQUIRE NONE WITH MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0 MAX_USER_CONNECTIONS 0;
FLUSH PRIVILEGES;