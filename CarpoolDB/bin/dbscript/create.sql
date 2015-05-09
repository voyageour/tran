CREATE DATABASE carpool;
USE carpool;

//--------PRIMARY KEY TABLES------------


CREATE TABLE address(
	address_id INT NOT NULL PRIMARY KEY,
	flat_no INT, 
	apartment_name VARCHAR(50) NOT NULL, 
	street_name VARCHAR(150) NOT NULL,
	landmark_name VARCHAR(100),
	city_name VARCHAR(30) NOT NULL,
	state_name VARCHAR(30) NOT NULL,
	country_name VARCHAR(15) NOT NULL,
	pincode TINYINT NOT NULL
);

CREATE TABLE source_to_destination(
	source_to_destination_id INT NOT NULL PRIMARY KEY,
	source_place VARCHAR(200) NOT NULL, 
	destination_place VARCHAR(200) NOT NULL, 
	in_between_places VARCHAR(500),
	source_leaving_time TIME
);

CREATE TABLE vehicle(
	vehicle_id INT NOT NULL PRIMARY KEY,
	vehicle_type TINYINT NOT NULL, 
	vehicle_registered_number VARCHAR(50) NOT NULL, 
	vehicle_name VARCHAR(50),
	vehicle_color VARCHAR(20)
);

CREATE TABLE place(
	place_id INT NOT NULL PRIMARY KEY,
	place_name VARCHAR(100) NOT NULL
);

CREATE TABLE status(
	status_id INT NOT NULL PRIMARY KEY,
	status_name VARCHAR(30) NOT NULL
);

CREATE TABLE permission(
	permission_id INT NOT NULL PRIMARY KEY,
	permission_name VARCHAR(40) NOT NULL
);


CREATE TABLE sequences(
	sequence_id INT NOT NULL PRIMARY KEY,
	sequence_name VARCHAR(30) NOT NULL,
	sequence_value INT NOT NULL
);

CREATE TABLE role(
	role_id INT NOT NULL PRIMARY KEY,
	role_name VARCHAR(40) NOT NULL
);

//--------FOREIGN KEY TABLES------------



CREATE TABLE carpooler(
	carpooler_id INT NOT NULL PRIMARY KEY,
	driving_licence_number VARCHAR(50) NOT NULL,
	user_id INT NOT NULL,
	FOREIGN KEY(user_id) REFERENCES user(user_id) ON DELETE CASCADE,
);

CREATE TABLE user(
	user_id INT NOT NULL PRIMARY KEY, 
	user_name VARCHAR(30) NOT NULL, 
	password VARCHAR(30) NOT NULL,
	email_id VARCHAR(30) NOT NULL,
	primary_contact_number VARCHAR(15) NOT NULL,
	secondary_contact_number VARCHAR(15),
	knowDriving TINYINT NOT NULL,
	status_id INT NOT NULL,
	address_id INT NOT NULL,
	carpooler_id INT NOT NULL,
	FOREIGN KEY(status_id) REFERENCES status(status_id) ON DELETE CASCADE,
	FOREIGN KEY(address_id) REFERENCES address(address_id) ON DELETE CASCADE,
	FOREIGN KEY(carpooler_id) REFERENCES carpooler(carpooler_id) ON DELETE CASCADE
);

CREATE TABLE role_permission(
	role_permission_id INT NOT NULL PRIMARY KEY, 
	role_id INT NOT NULL, 
	permission_id INT NOT NULL,
	FOREIGN KEY(role_id) REFERENCES role(role_id) ON DELETE CASCADE,
	FOREIGN KEY(permission_id) REFERENCES permission(permission_id) ON DELETE CASCADE
);
