/*ADDING PRIMARY KEY TO EXISTING FIELD*/
ALTER TABLE carpooler_preference ADD PRIMARY KEY (carpooler_preference_id);

/*For drooping foreign key column in mysql, in our case it was vehicle_id*/

SHOW CREATE TABLE carpooler;
alter table carpooler drop foreign key carpooler_ibfk_1;
alter table carpooler drop column vehicle_id;

/*For drooping foreign key column in mysql, in our case it was address_id from user table*/

SHOW CREATE TABLE user;
alter table user drop foreign key user_ibfk_2;
alter table user drop column address_id;

/*For drooping foreign key column in mysql, in our case it was carpooler_id from user table*/

SHOW CREATE TABLE user;
alter table user drop foreign key user_ibfk_3;
alter table user drop column carpooler_id;

/*For drooping foreign key column in mysql, in our case it was user_id from address table*/

SHOW CREATE TABLE user;
alter table user drop foreign key user_ibfk_3;
alter table user drop column carpooler_id;


/*For adding foreign key column in mysql, in our case it is carpooler_id to vehicle*/

ALTER TABLE vehicle ADD COLUMN carpooler_id INT NOT NULL AFTER vehicle_color;
ALTER TABLE vehicle ADD FOREIGN KEY (carpooler_id) REFERENCES Carpooler(carpooler_id);

/*For adding foreign key column in mysql, in our case it is carpooler_id to vehicle*/

ALTER TABLE source_to_destination ADD COLUMN carpooler_id INT NOT NULL AFTER source_leaving_time;
ALTER TABLE source_to_destination ADD FOREIGN KEY (carpooler_id) REFERENCES Carpooler(carpooler_id);


/*For adding foreign key column in mysql, in our case it is user_id to carpooler*/

ALTER TABLE carpooler ADD COLUMN user_id INT NOT NULL AFTER driving_licence_number;
ALTER TABLE carpooler ADD FOREIGN KEY (user_id) REFERENCES user(user_id);

/*For adding foreign key column in mysql, in our case it is user_id to address*/

ALTER TABLE address ADD COLUMN user_id INT NOT NULL AFTER pincode;
ALTER TABLE address ADD FOREIGN KEY (user_id) REFERENCES user(user_id);


/*For adding foreign key column in mysql, in our case it is address_id to user table*/

ALTER TABLE user ADD COLUMN address_id INT NOT NULL AFTER status_id;
ALTER TABLE user ADD FOREIGN KEY (address_id) REFERENCES address(address_id);


/*For adding foreign key column in mysql, in our case it is role_id to user table*/

ALTER TABLE user ADD COLUMN role_id INT NOT NULL AFTER address_id;
ALTER TABLE user ADD FOREIGN KEY (role_id) REFERENCES role(role_id);

/*For altering the name of the knowDriving in user table to know_driving */

ALTER TABLE user CHANGE knowDriving know_driving TINYINT ;

ALTER TABLE address CHANGE pincode pincode INT;


ALTER TABLE carpooler MODIFY COLUMN driving_licence_number VARCHAR(20);
ALTER TABLE carpooler ADD COLUMN user_type VARCHAR(15) NOT NULL AFTER driving_licence_number;


ALTER TABLE carpooler ADD FOREIGN KEY (carpooler_preference_id) REFERENCES carpooler_preference(carpooler_preference_id);


ALTER TABLE feedback ADD COLUMN user_id INT NOT NULL;
ALTER TABLE feedback ADD FOREIGN KEY (user_id) REFERENCES user(user_id);

