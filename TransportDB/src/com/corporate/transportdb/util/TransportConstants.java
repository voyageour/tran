package com.corporate.transportdb.util;

import java.util.Date;

public class TransportConstants {

	public static final String LATE_NIGHT_CAB="night_cab";
	public static final String REGULAR_CAB="regular_cab";

	public static final String STATUS_INACTIVE="INACTIVE";
	public static final String STATUS_ACTIVE="ACTIVE";
	
	public static final String ROLE_USER="ROLE_USER";
	public static final String ROLE_ADMIN="ROLE_ADMIN";
	
	public static final Long ELECTRONIC_CITY_PLACE_ID=6l;

	
	public static final int REQUEST_PENDING=1;
	public static final int REQUEST_CLOSED=2;
	public static final int REQUEST_ON_HOLD=3;
	
	public static final String ADMIN_COMMENT_SEPERATOR="|";
	
	public static final String ADMIN_COMMENT_BUS_PASS_COLLECTED="Employee has collected the Bus pass on "+new Date();;
	
	
	
	//FEEDBACK
	public static int FEEDBACK_PRAISE = 1;
	public static int FEEDBACK_GENERAL_COMMENT = 2;
	public static int FEEDBACK_SUGGESTION = 3;
	public static int FEEDBACK_PROBLEM = 4;
	public static String FEEDBACK_SAVING_SUCCESS = "We received your Feedback. Appreciate your valuable time in giving us Feedback.";
	public static String FEEDBACK_SAVING_FAILURE = "Due to some technical Error, we have not received your feedback. Appreciate your valuable time in giving us Feedback.";
	public static boolean FEEDBACK_INACTIVE = false;
		
}
