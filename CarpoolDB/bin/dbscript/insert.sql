INSERT INTO sequences(sequence_id, sequence_name, sequence_value) values(1, "user_sequence",5);
INSERT INTO sequences(sequence_id, sequence_name, sequence_value) values(2, "address_sequence",5);
INSERT INTO sequences(sequence_id, sequence_name, sequence_value) values(3, "carpooler_sequence",5);
INSERT INTO sequences(sequence_id, sequence_name, sequence_value) values(4, "places_sequence",5);
INSERT INTO sequences(sequence_id, sequence_name, sequence_value) values(5, "source_to_destination_sequence",5);
INSERT INTO sequences(sequence_id, sequence_name, sequence_value) values(6, "permission_sequence",5);
INSERT INTO sequences(sequence_id, sequence_name, next_val) values(7, "role_sequence", 5);
INSERT INTO sequences(sequence_id, sequence_name, next_val) values(8, "status_sequence", 5);
INSERT INTO sequences(sequence_id, sequence_name, next_val) values(9, "vehicle_details_sequence", 5);


INSERT into carpooler(carpooler_id, user_type,created_date,user_id,availability) values(1, "provider", "2013-02-19 12:22:52", 595, 1);

INSERT INTO source_to_destination(source_to_destination_id,source_place,destination_place,in_between_places,
source_leaving_time,carpool_on_days, availability, carpooler_id) 
values(1,"marathalli","JP Nagar", "BTM --> Silk Board", "17:46:15", "Mon,Tue,Wed", 1, 1);

INSERT INTO carpooler_preference(carpooler_preference_id,way_of_contact,gender_preference,
compensation,carpooler_id) values(1,"email","any","free", 1);


