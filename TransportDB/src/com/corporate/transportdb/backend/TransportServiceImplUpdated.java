package com.corporate.transportdb.backend;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Component;

import org.springframework.transaction.annotation.Transactional;

import com.corporate.transportdb.domain.RouteDetailsHelper;
import com.corporate.transportdb.dto.updated.BusFare;
import com.corporate.transportdb.dto.updated.DriverUpdated;
import com.corporate.transportdb.dto.updated.DriverVehicleMappingUpdated;
import com.corporate.transportdb.dto.updated.FeedbackUpdated;
import com.corporate.transportdb.dto.updated.News;
import com.corporate.transportdb.dto.updated.PlaceUpdated;
import com.corporate.transportdb.dto.updated.Role;
import com.corporate.transportdb.dto.updated.RouteDriverVehicleMappingUpdated;
import com.corporate.transportdb.dto.updated.RoutePlaceMappingUpdated;
import com.corporate.transportdb.dto.updated.RouteUpdated;
import com.corporate.transportdb.dto.updated.Status;
import com.corporate.transportdb.dto.updated.UserRequestNew;
import com.corporate.transportdb.dto.updated.UserRouteMappingForNightCabUpdated;
import com.corporate.transportdb.dto.updated.UserRouteMappingUpdated;
import com.corporate.transportdb.dto.updated.UserUpdated;
import com.corporate.transportdb.dto.updated.VehicleUpdated;
import com.corporate.transportdb.util.TransportConstants;

@Component
@Transactional(readOnly = false, value="transactionManagerTransport") 
public class TransportServiceImplUpdated extends HibernateDaoSupport implements TransportServiceUpdated{

	@Autowired
	public void init(@Qualifier("sessionFactoryTransport") SessionFactory factory) {
		setSessionFactory(factory);
	}

	@Override
	public List<UserUpdated> getAllUserUpdated(){
		List list = null;
		String hql = "FROM UserUpdated uu";
		list = getHibernateTemplate().find(hql);
		if (list != null && list.size()>0) {
			System.out.println("User Found");
		}			
		return list;
	}

	@Override
	@SuppressWarnings("unchecked")
	public UserUpdated getUserByUserName(String userName) {
		System.out.println("Request received for fetching user by user name");
		List list = null;


		String query = "from UserUpdated u where u.userName=?";
		Object[] queryParam = {userName};
		list = getHibernateTemplate().find(query, queryParam);

		if (list != null && list.size()>0) {
			System.out.println("User Found");
		}			

		System.out.println("Request completed for fetching user by user name");
		return (list != null && list.size() > 0 ? (UserUpdated)list.get(0) : null);
	}

	@Override
	public UserUpdated getUserByUserId(Long userId) {
		System.out.println("Request received for fetching user by user Id");
		List list = null;

		String query = "from UserUpdated u where u.userId=?";
		Object[] queryParam = {userId};
		list = getHibernateTemplate().find(query, queryParam);

		if (list != null && list.size()>0) {
			System.out.println("User Found");
		}			

		System.out.println("Request completed for fetching user by user id");
		return (list != null && list.size() > 0 ? (UserUpdated)list.get(0) : null);
	}

	@Override
	public List<UserRouteMappingUpdated> getAllUserByRoute(String routeName){
		String hql1 = "FROM UserRouteMappingUpdated urmu where urmu.route.routeName=?";
		Object[] queryParam = {routeName};
		List<UserRouteMappingUpdated> listOfUserRouteMappingUpdated = getHibernateTemplate().find(hql1, queryParam);
		return listOfUserRouteMappingUpdated;
	}



	@Override
	public RouteDetailsHelper getCompleteTravellerDetailsByRoute(String routeName, String cabType){


		String query = "FROM RouteUpdated route where route.routeName=?";
		Object[] queryParam = {routeName};
		List<RouteUpdated> listOfRoutes = getHibernateTemplate().find(query, queryParam);

		//for (int i = 0; i < listORoutes.size(); i++) {

		RouteDetailsHelper routeDetailsUpdated=null;
		if(listOfRoutes!=null && listOfRoutes.size()>0){
			routeDetailsUpdated = new RouteDetailsHelper();

			RouteUpdated route = listOfRoutes.get(0);

			String query1 = "FROM RoutePlaceMappingUpdated rpmu where rpmu.route.routeName=? order by rpmu.sequenceArrivalAtPlace asc";
			List<RoutePlaceMappingUpdated> listOfRoutePlaceMappingUpdated = getHibernateTemplate().find(query1, queryParam);


			String hql3=null;
			if(cabType.equals(TransportConstants.REGULAR_CAB)){
				hql3 = "FROM UserRouteMappingUpdated urm where urm.route.routeName=?";	
			}else{
				hql3 = "FROM UserRouteMappingForNightCabUpdated urm where urm.route.routeName=?";
			}


			if(cabType.equals(TransportConstants.REGULAR_CAB)){
				List<UserRouteMappingUpdated> listOfUserRouteMappingUpdated=getHibernateTemplate().find(hql3, queryParam);	
				routeDetailsUpdated.setListOfUserRouteMappingUpdated(listOfUserRouteMappingUpdated);
			}else{
				List<UserRouteMappingForNightCabUpdated> listOfUserRouteMappingForNightCabUpdated = getHibernateTemplate().find(hql3, queryParam);
				routeDetailsUpdated.setListOfUserRouteMappingForNightCabUpdated(listOfUserRouteMappingForNightCabUpdated);
			}


			String hql4 = "FROM RouteDriverVehicleMappingUpdated rdvm where rdvm.route.routeName=?";
			List<RouteDriverVehicleMappingUpdated> listOfDriverMappingUpdated = getHibernateTemplate().find(hql4, queryParam);



			routeDetailsUpdated.setRoute(route);
			routeDetailsUpdated.setListOfRoutePlaceMappingUpdated(listOfRoutePlaceMappingUpdated);

			if(listOfDriverMappingUpdated!=null && listOfDriverMappingUpdated.size()>0){
				routeDetailsUpdated.setRouteDriverVehicleMappingUpdated(listOfDriverMappingUpdated.get(0));
			}

		}

		System.out.println("Reached");

		return routeDetailsUpdated;
	}

	@Override
	public RouteDetailsHelper getAllInBetweenPlaceOfRouteByRouteName(String routeName){

		String hql1 = "FROM RouteUpdated route where route.routeName=?";
		Object[] queryParam = {routeName};
		List<RouteUpdated> listORoutes = getHibernateTemplate().find(hql1, queryParam);

		RouteDetailsHelper routeDetailsUpdated=null;
		if(listORoutes!=null && listORoutes.size()>0){

			RouteUpdated route = listORoutes.get(0);

			String hql2 = "FROM RoutePlaceMappingUpdated rpm where rpm.route.routeName=?";
			List<RoutePlaceMappingUpdated> listOfRoutePlaceMappingUpdated = getHibernateTemplate().find(hql2, queryParam);

			routeDetailsUpdated = new RouteDetailsHelper();
			routeDetailsUpdated.setRoute(route);
			routeDetailsUpdated.setListOfRoutePlaceMappingUpdated(listOfRoutePlaceMappingUpdated);
		}
		return routeDetailsUpdated;
	}


	@Override
	public List<RoutePlaceMappingUpdated> getAllInBetweenPlaceOfRouteByRouteId(Long routeId){
		String hql1 = "FROM RoutePlaceMappingUpdated rpmu where rpmu.route.routeId=?";
		Object[] queryParam = {routeId};
		List<RoutePlaceMappingUpdated> listOfRoutePlaceMappingUpdated = getHibernateTemplate().find(hql1, queryParam);

		return listOfRoutePlaceMappingUpdated;
	}


	@Override
	public boolean deleteAllInBetweenPlaceOfRouteByRouteId(Long routeId){
		List<RoutePlaceMappingUpdated> listOfRoutePlaceMappingUpdated = getAllInBetweenPlaceOfRouteByRouteId(routeId);
		getHibernateTemplate().deleteAll(listOfRoutePlaceMappingUpdated);
		return true;
	}

	//
	//	@Override
	//	public boolean deleteAllInBetweenPlaceOfRouteByRouteObject(RouteUpdated route){
	//
	//		getAllInBetweenPlaceOfRouteByRouteId(routeId)
	//		getHibernateTemplate().get(RoutePlaceMappingUpdated.class,)
	//		getHibernateTemplate().delete();
	//		
	//		getHibernateTemplate().delete(route);
	//		return true;
	//	}


	@Override
	public List<RouteDetailsHelper> getAllRouteDetailsWithAllUserAndInBetweenPlaces(String regularOrNight){
		List<RouteDetailsHelper> listOfRouteDetailsHelper=new ArrayList<RouteDetailsHelper>();

		String hql = "FROM RouteUpdated route where 1=1";
		if(regularOrNight!=null){
			if(regularOrNight.equals(TransportConstants.REGULAR_CAB)){
				hql = hql + "and route.regularCab =true";
			}
			else if(regularOrNight.equals(TransportConstants.LATE_NIGHT_CAB)){
				hql = hql + "and route.regularCab =false";
			}
		}

		List<RouteUpdated> listOfRouteUpdated = getHibernateTemplate().find(hql);


		if(listOfRouteUpdated!=null && listOfRouteUpdated.size()>0){

			for (int i = 0; i < listOfRouteUpdated.size(); i++) {

				RouteUpdated route = listOfRouteUpdated.get(i);

				RouteDetailsHelper routeDetailsHelper = new RouteDetailsHelper();
				routeDetailsHelper.setRoute(route);

				Object[] queryParam = {route.getRouteId()};
				String hql2 = "FROM RoutePlaceMappingUpdated rpm where rpm.route.routeId = ? order by rpm.sequenceArrivalAtPlace";
				List<RoutePlaceMappingUpdated> listofRoutePlaceMappingUpdated = getHibernateTemplate().find(hql2, queryParam);
				routeDetailsHelper.setListOfRoutePlaceMappingUpdated(listofRoutePlaceMappingUpdated);


				List<UserRouteMappingUpdated> listOfUserRouteMappingUpdated=null;
				List<UserRouteMappingForNightCabUpdated> listOfUserRouteMappingForNightCabUpdated=null;

				if(regularOrNight.equals(TransportConstants.REGULAR_CAB)){
					String hql3 = "FROM UserRouteMappingUpdated urm where urm.route.routeId = ? order by urm.place.placeId";
					listOfUserRouteMappingUpdated = getHibernateTemplate().find(hql3, queryParam);
					routeDetailsHelper.setListOfUserRouteMappingUpdated(listOfUserRouteMappingUpdated);
				}
				else if(regularOrNight.equals(TransportConstants.LATE_NIGHT_CAB)){
					String hql3 = "FROM UserRouteMappingForNightCabUpdated urmfncu where urmfncu.route.routeId = ? order by urmfncu.place.placeId";
					listOfUserRouteMappingForNightCabUpdated = getHibernateTemplate().find(hql3, queryParam);
					routeDetailsHelper.setListOfUserRouteMappingForNightCabUpdated(listOfUserRouteMappingForNightCabUpdated);
				}


				String hql4 = "FROM RouteDriverVehicleMappingUpdated rdvm where rdvm.route.routeId = ?";
				List<RouteDriverVehicleMappingUpdated> listOfRouteDriverVehicleMappingUpdated = getHibernateTemplate().find(hql4, queryParam);

				if(listOfRouteDriverVehicleMappingUpdated!=null && listOfRouteDriverVehicleMappingUpdated.size()>0){
					routeDetailsHelper.setRouteDriverVehicleMappingUpdated(listOfRouteDriverVehicleMappingUpdated.get(0));
				}

				listOfRouteDetailsHelper.add(routeDetailsHelper);
			}
		}

		System.out.println("Reached");

		return listOfRouteDetailsHelper;

	}




	@Override
	public List<RouteDetailsHelper> getAllRouteDetailsWithInBetweenPlacesAndRouteDriverVehicleMapping(
			String nightCabOrRegular) {

		List<RouteDetailsHelper> listOfRouteDetailsHelper=new ArrayList<RouteDetailsHelper>();

		String hql = "FROM RouteUpdated route where 1=1";
		if(nightCabOrRegular!=null){
			if(nightCabOrRegular.equals(TransportConstants.REGULAR_CAB)){
				hql = hql + "and route.regularCab =true";
			}
			else if(nightCabOrRegular.equals(TransportConstants.LATE_NIGHT_CAB)){
				hql = hql + "and route.regularCab =false";
			}
		}

		List<RouteUpdated> listOfRouteUpdated = getHibernateTemplate().find(hql);

		if(listOfRouteUpdated!=null && listOfRouteUpdated.size()>0){

			for (int i = 0; i < listOfRouteUpdated.size(); i++) {

				RouteUpdated route = listOfRouteUpdated.get(i);

				Object[] queryParam = {route.getRouteId()};
				String hql2 = "FROM RoutePlaceMappingUpdated rpm where rpm.route.routeId = ? order by rpm.sequenceArrivalAtPlace";
				List<RoutePlaceMappingUpdated> listofRoutePlaceMappingUpdated = getHibernateTemplate().find(hql2, queryParam);

				String hql3 = "FROM RouteDriverVehicleMappingUpdated rdvmu where rdvmu.route.routeId=?";
				List<RouteDriverVehicleMappingUpdated> listOfRouteDriverVehicleMappingUpdated = getHibernateTemplate().find(hql3, queryParam);


				RouteDetailsHelper routeDetailsHelper = new RouteDetailsHelper();
				routeDetailsHelper.setRoute(route);
				routeDetailsHelper.setListOfRoutePlaceMappingUpdated(listofRoutePlaceMappingUpdated);
				if(listOfRouteDriverVehicleMappingUpdated!=null && listOfRouteDriverVehicleMappingUpdated.size()>0){
					routeDetailsHelper.setRouteDriverVehicleMappingUpdated(listOfRouteDriverVehicleMappingUpdated.get(0));
				}
				listOfRouteDetailsHelper.add(routeDetailsHelper);
			}
		}

		return listOfRouteDetailsHelper;
	}


	/*
	@Override
	public List<RouteDetailsUpdated> getAllRouteDetailsWithInBetweenPlaces(String nightCabOrRegular) {

		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		session.beginTransaction();

		List<RouteDetailsUpdated> listOfRouteDetailsUpdated=null;

		try{
			String strDateFrom=null;
			String hql1 = null;

			if(nightCabOrRegular.equals(TransportConstants.REGULAR_CAB)){
				strDateFrom = "11:00:00";
				hql1 = "FROM RouteUpdated route where route.sourceStartTime < :sourceStartTime ";
			}else{
				strDateFrom = "19:00:00";
				hql1 = "FROM RouteUpdated route where route.sourceStartTime > :sourceStartTime ";
			}

			SimpleDateFormat formatter = new SimpleDateFormat("HH:mm:ss");
			Date dateFrom = formatter.parse(strDateFrom);

			org.hibernate.Query query1 = session.createQuery(hql1);
			query1.setParameter("sourceStartTime", dateFrom);
			List<RouteUpdated> listORoutes = query1.list();


			listOfRouteDetailsUpdated = new ArrayList<RouteDetailsUpdated>();

			if(listORoutes!=null && listORoutes.size()>0){

				for (int i = 0; i < listORoutes.size(); i++) {

					RouteUpdated route = listORoutes.get(i);

					String hql2 = "FROM PlaceUpdated place where place.route.routeName = :routeName";
					org.hibernate.Query query2 = session.createQuery(hql2);
					query2.setParameter("routeName",route.getRouteName());

					List<PlaceUpdated> listOfPlaceUpdated = query2.list();
					List<PlaceUpdated> listOfPlaceUpdatedReverse = new ArrayList<PlaceUpdated>();

					for (int j = listOfPlaceUpdated.size()-1; j >= 0 ; j--) {
						PlaceUpdated placeUpdated = listOfPlaceUpdated.get(j);
						listOfPlaceUpdatedReverse.add(placeUpdated);
					}

					String hql4 = "FROM RouteDriverMappingUpdated rdm where rdm.route.routeName = :routeName";
					org.hibernate.Query query4 = session.createQuery(hql4);
					query4.setParameter("routeName",route.getRouteName());
					List<RouteDriverVehicleMappingUpdated> listOfDriverMappingUpdated = query4.list();


					RouteDetailsUpdated rdu = new RouteDetailsUpdated();
					rdu.setRoute(route);
					rdu.setListOfPlaceUpdated(listOfPlaceUpdated);
					rdu.setListOfPlaceUpdatedReverse(listOfPlaceUpdatedReverse);
					if(listOfDriverMappingUpdated.get(0)!=null)
						rdu.setRouteDriverMappingUpdated(listOfDriverMappingUpdated.get(0));



					listOfRouteDetailsUpdated.add(rdu);

				}
			}

			session.getTransaction().commit();
			session.close();

		}catch (Exception e) {
			System.out.println("TransportServiceImplUpdated.getAllRouteDetails() :"+e.getMessage());
		}
		return listOfRouteDetailsUpdated;
	}
	 */



	/*
	@Override
	public List<UserRouteMappingForNightCabUpdated> getUserBookedNightCabOnDate(String dateOfBooking){


		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		session.beginTransaction();

		List<UserRouteMappingForNightCabUpdated> listOfUserRouteMappingForNightCabUpdated=null;
		try{
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
			Date dateFrom = formatter.parse(dateOfBooking);

			String hql = "FROM UserRouteMappingForNightCabUpdated urmfncu WHERE urmfncu.dateOfBooking = :dateOfBooking";
			org.hibernate.Query query = session.createQuery(hql);
			query.setParameter("dateOfBooking", dateFrom);


			listOfUserRouteMappingForNightCabUpdated = query.list();

			for (UserRouteMappingForNightCabUpdated userRouteMappingForNightCabUpdated : listOfUserRouteMappingForNightCabUpdated) {
				System.out.println(userRouteMappingForNightCabUpdated.getUser().getUserName() + "  " + userRouteMappingForNightCabUpdated.getRoute().getRouteName());
			}
		}catch (Exception e) {
			System.out.println("Error while parsing date :"+e.getMessage());
		}
		session.getTransaction().commit();
		session.close();

		return listOfUserRouteMappingForNightCabUpdated;		
	}
	 */

	@Override
	public List<News> getAllActiveNews(){
		List list = null;
		String hql = "FROM News news where news.newsActiveFromDate<=now() and news.newsActiveTillDate>=now()";
		list = getHibernateTemplate().find(hql);
		if (list != null && list.size()>0) {
			System.out.println("News Found");
		}
		return list;
	}

	@Override
	public List<News> getAllNews(){
		List list = null;
		String hql = "FROM News news";
		list = getHibernateTemplate().find(hql);
		if (list != null && list.size()>0) {
			System.out.println("News Found");
		}			
		return list;
	}

	@Override
	public News getNewsByNewsId(long newsId){
		List list = null;
		String query = "from News news where news.newsId=?";
		Object[] queryParam = {newsId};
		list = getHibernateTemplate().find(query, queryParam);

		if (list != null && list.size()>0) {
			System.out.println("News Found");
		}			
		System.out.println("Request completed for fetching news by newsId");
		return (list != null && list.size() > 0 ? (News)list.get(0) : null);
	}

	@Override
	public boolean deleteNews(News news){
		getHibernateTemplate().delete(news);
		return true;		
	}

	@Override
	public boolean deleteUserUpdated(UserUpdated user) {
		getHibernateTemplate().delete(user);
		return true;		
	}
	
	@Override
	public boolean saveNews(News news) {
		Long newsId = (Long)getHibernateTemplate().save(news);
		if(newsId!=null){
			return true;
		}
		return false;
	}

	@Override
	public boolean updateNews(News news) {
		getHibernateTemplate().update(news);
		return true;		
	}


	@Override
	public UserUpdated getUserByEmailId(String emailId) {

		System.out.println("Request received for fetching user by email id.");
		List list = null;


		String query = "from UserUpdated u where u.emailId=?";
		Object[] queryParam = {emailId};
		list = getHibernateTemplate().find(query, queryParam);

		if (list != null && list.size()>0) {
			System.out.println("User Found");
		}			

		System.out.println("Request completed for fetching user by email id");
		return (list != null && list.size() > 0 ? (UserUpdated)list.get(0) : null);

	}


	@Override
	public RouteUpdated getRouteByRouteName(String routeName) {

		List listOfRouteUpdated = null;

		String query = "FROM RouteUpdated route where route.routeName=?";
		Object[] queryParam = {routeName};
		listOfRouteUpdated = getHibernateTemplate().find(query, queryParam);

		return (listOfRouteUpdated != null && listOfRouteUpdated.size() > 0 ? (RouteUpdated)listOfRouteUpdated.get(0) : null);
	}


	@Override
	public boolean saveUserRouteMappingForNightCabUpdatedDetails(UserRouteMappingForNightCabUpdated userRouteMappingForNightCabUpdated) {
		Long userRouteMappingForNightCabUpdatedId = (Long)getHibernateTemplate().save(userRouteMappingForNightCabUpdated);
		if(userRouteMappingForNightCabUpdatedId!=null){
			return true;
		}
		return false;
	}

	@Override
	public boolean deleteUserRouteMappingForNightCabUpdatedDetailsByUserId(
			long userId) {
		getHibernateTemplate().bulkUpdate("delete from  UserRouteMappingForNightCabUpdated urmncu where urmncu.user.userId = ?" , userId);
		return true;		
	}



	@Override
	public boolean saveUserRouteMapping(UserRouteMappingUpdated userRouteMapping) {
		Long userRouteMappingId = (Long)getHibernateTemplate().save(userRouteMapping);
		if(userRouteMappingId!=null){
			return true;
		}
		return false;
	}

	@Override
	public boolean updateUserRouteMapping(UserRouteMappingUpdated userRouteMapping) {
		getHibernateTemplate().update(userRouteMapping);
		return true;
	}


	/*
	@Override
	public boolean enableMonthlyBusPassToUserForRoute(UserUpdated user, RouteUpdated route) {

		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		session.beginTransaction();

		session.save(user);

		UserRouteMappingUpdated userRouteMappingUpdated = new UserRouteMappingUpdated();
		userRouteMappingUpdated.setRoute(route);
		userRouteMappingUpdated.setUser(user);


		session.getTransaction().commit();
		session.close();

		return true;
	}

	 */
	@Override
	public Role getRoleByRoleName(String roleName) {

		System.out.println("Request received for fetching user by role name");
		List list = null;


		String query = "from Role r where r.roleName=?";
		Object[] queryParam = {roleName};
		list = getHibernateTemplate().find(query, queryParam);

		if (list != null && list.size()>0) {
			System.out.println("Role Found");
		}			

		System.out.println("Request completed for fetching user by user name");
		return (list != null && list.size() > 0 ? (Role)list.get(0) : null);

	}


	@Override
	public Status getStatusByName(String statusName) {

		System.out.println("Request received for fetching Status by name");
		List list = null;


		String query = "from Status s where s.statusName=?";
		Object[] queryParam = {statusName};
		list = getHibernateTemplate().find(query, queryParam);

		if (list != null && list.size()>0) {
			System.out.println("Status Found");
		}			

		System.out.println("Request completed for fetching user by user name");
		return (list != null && list.size() > 0 ? (Status)list.get(0) : null);
	}


	@Override
	public boolean saveUser(UserUpdated user) {
		try{
			Long userId = (Long)getHibernateTemplate().save(user);
			if(userId!=null){
				return true;
			}
		}catch (Exception e) {
			System.out.println("TransportServiceImplUpdated.saveUser() exception :"+e.getMessage());
		}
		return false;
	}

	/*
	@Override
	public boolean saveVehicleDetailsWithDriver(DriverUpdated driverUpdated) {

		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		session.beginTransaction();


		session.save(driverUpdated.getVehicle());

		session.getTransaction().commit();
		session.close();



		VehicleUpdated vehicleUpdated = getVehicleByVehicleNumber(driverUpdated.getVehicle().getVehicleNumber());


		if(vehicleUpdated!=null){
			SessionFactory sf1 = HibernateUtil.getSessionFactory();
			Session session1 = sf1.openSession();
			session1.beginTransaction();

			DriverUpdated d = new DriverUpdated();
			d.setDriverName(driverUpdated.getDriverName());
			d.setDriverMobileNumber(driverUpdated.getDriverMobileNumber());
			d.setVehicle(vehicleUpdated);

			session1.save(d);
			session1.getTransaction().commit();
			session1.close();
		}

		return true;	
	}
	 */

	@Override
	public VehicleUpdated getVehicleByVehicleId(Long vehicleId){
		List list = null;

		String hql = "FROM  VehicleUpdated v where v.vehicleId=?";
		Object[] queryParam = {vehicleId};
		list = getHibernateTemplate().find(hql, queryParam);

		if (list != null && list.size()>0) {
			System.out.println("Vehicle Found");
		}			

		System.out.println("Request completed for fetching Vehicle by VehicleId");
		return (list != null && list.size() > 0 ? (VehicleUpdated)list.get(0) : null);
	}



	@Override
	public boolean saveDriver(DriverUpdated driver) {
		Long driverId = (Long)getHibernateTemplate().save(driver);
		if(driverId!=null){
			return true;
		}
		return false;
	}


	@Override
	public boolean updateDriver(DriverUpdated driver) {
		getHibernateTemplate().update(driver);
		return true;		
	}


	@Override
	public List<VehicleUpdated> getAllVehicles() {		
		List list = null;

		String hql = "FROM VehicleUpdated v";
		list = getHibernateTemplate().find(hql);

		if (list != null && list.size()>0) {
			System.out.println("Vehicles Found");
		}else{
			System.out.println("No Vehicle Found");
		}
		return list;
	}


	@Override
	public List<DriverUpdated> getAllDriver() {
		List list = null;

		String hql = "FROM DriverUpdated d";
		list = getHibernateTemplate().find(hql);

		if (list != null && list.size()>0) {
			System.out.println("Driver Found");
		}else{
			System.out.println("No Driver Found");
		}
		return list;
	}



	@Override
	public boolean deleteVehicle(VehicleUpdated v) {
		getHibernateTemplate().delete(v);
		return true;
	}

	@Override
	public boolean deleteDriver(DriverUpdated driver) {
		getHibernateTemplate().delete(driver);
		return true;
	}



	/*
	@Override
	public boolean deleteRouteByRouteId(Long routeId) {

		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		session.beginTransaction();


		String hql = "delete RouteUpdated ru where ru.routeId=:routeId";
		org.hibernate.Query query = session.createQuery(hql);
		query.setParameter("routeId", routeId);
		int result = query.executeUpdate();

		session.getTransaction().commit();
		session.close();

		if(result<=0){
			return false;
		}else{
			return true;
		}

	}


	@Override
	public boolean deleteDriverByVehicleId(Long vehicleId) {

		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		session.beginTransaction();


		String hql = "delete DriverUpdated driver where driver.vehicle.vehicleId=:vehicleId";
		org.hibernate.Query query = session.createQuery(hql);
		query.setParameter("vehicleId", vehicleId);
		int result = query.executeUpdate();

		session.getTransaction().commit();
		session.close();

		if(result<=0){
			return false;
		}else{
			return true;
		}		


	}

	@Override
	public DriverUpdated getDriverByVehicleId(Long vehicleId) {

		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		session.beginTransaction();

		String hql = "FROM DriverUpdated driverUpdated where driverUpdated.vehicle.vehicleId =:vehicleId";
		org.hibernate.Query query = session.createQuery(hql);
		query.setParameter("vehicleId", vehicleId);
		List<DriverUpdated> listOfDriverUpdated = query.list();


		session.getTransaction().commit();
		session.close();

		return (listOfDriverUpdated != null && listOfDriverUpdated.size() > 0 ? (DriverUpdated)listOfDriverUpdated.get(0) : null);		

	}


	@Override
	public boolean saveRoute(RouteUpdated routeUpdated) {

		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		session.beginTransaction();

		session.save(routeUpdated);

		session.getTransaction().commit();
		session.close();

		return true;
	}

	@Override
	public boolean updateRoute(RouteUpdated routeUpdated) {
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		session.beginTransaction();

		session.update(routeUpdated);

		session.getTransaction().commit();
		session.close();

		return true;
	}

	 */
	@Override
	public boolean savePlace(PlaceUpdated place) {
		Long placeId = (Long)getHibernateTemplate().save(place);
		if(placeId!=null){
			return true;
		}
		return false;
	}

	@Override
	public boolean saveVehicle(VehicleUpdated v) {
		Long vehicleId = (Long)getHibernateTemplate().save(v);
		if(vehicleId!=null){
			return true;
		}
		return false;
	}





	@Override
	public RouteDetailsHelper getAllRouteDetailsWithInBetweenPlacesAndRouteDriverVehicleMappingByRouteId(Long routeId, String nightCabOrRegular) {

		RouteDetailsHelper routeDetailsHelper=new RouteDetailsHelper();

		String hql = "FROM RouteUpdated route where 1=1 and route.routeId=?";
		if(nightCabOrRegular!=null){
			if(nightCabOrRegular.equals(TransportConstants.REGULAR_CAB)){
				hql = hql + "and route.regularCab =true";
			}
			else if(nightCabOrRegular.equals(TransportConstants.LATE_NIGHT_CAB)){
				hql = hql + "and route.regularCab =false";
			}
		}

		Object[] queryParam = {routeId};
		List<RouteUpdated> listOfRouteUpdated = getHibernateTemplate().find(hql,queryParam);

		if(listOfRouteUpdated!=null && listOfRouteUpdated.size()>0){

			RouteUpdated route = listOfRouteUpdated.get(0);

			String hql2 = "FROM RoutePlaceMappingUpdated rpm where rpm.route.routeId = ? order by rpm.sequenceArrivalAtPlace";
			List<RoutePlaceMappingUpdated> listofRoutePlaceMappingUpdated = getHibernateTemplate().find(hql2, queryParam);

			String hql3 = "FROM RouteDriverVehicleMappingUpdated rdvmu where rdvmu.route.routeId=?";
			List<RouteDriverVehicleMappingUpdated> listOfRouteDriverVehicleMappingUpdated = getHibernateTemplate().find(hql3, queryParam);

			routeDetailsHelper.setRoute(route);
			routeDetailsHelper.setListOfRoutePlaceMappingUpdated(listofRoutePlaceMappingUpdated);
			if(listOfRouteDriverVehicleMappingUpdated!=null && listOfRouteDriverVehicleMappingUpdated.size()>0){
				routeDetailsHelper.setRouteDriverVehicleMappingUpdated(listOfRouteDriverVehicleMappingUpdated.get(0));
			}
		}

		return routeDetailsHelper;
	}

	/*
	@Override
	public RouteUpdated getRouteByRouteId(Long routeId) {

		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		session.beginTransaction();

		String hql = "FROM RouteUpdated route where route.routeId =:routeId";
		org.hibernate.Query query = session.createQuery(hql);
		query.setParameter("routeId", routeId);
		List<RouteUpdated> listOfRouteUpdated = query.list();


		session.getTransaction().commit();
		session.close();

		return (listOfRouteUpdated != null && listOfRouteUpdated.size() > 0 ? (RouteUpdated)listOfRouteUpdated.get(0) : null);
	}


	@Override
	public boolean deleteAllInBetweenPlacesOfRouteByRouteId(Long routeId) {

		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		session.beginTransaction();

		String hql = "delete PlaceUpdated pu where pu.route.routeId=:routeId";
		org.hibernate.Query query = session.createQuery(hql);
		query.setParameter("routeId", routeId);
		query.executeUpdate();

		session.getTransaction().commit();
		session.close();

		return true;
	}*/

	@Override
	public List<PlaceUpdated> getAllPlace() {
		List list = null;

		String hql = "FROM PlaceUpdated place";
		list = getHibernateTemplate().find(hql);

		if (list != null && list.size()>0) {
			System.out.println("Places Found");
		}else{
			System.out.println("No Places Found");
		}
		return list;
	}

	@Override
	public List<PlaceUpdated> getAllPlaceMatchingWithGivenWord(String placeName) {
		System.out.println("Get in here");
		List list = null;

		String hql = "FROM PlaceUpdated place where place.placeName like ?";
		Object[] queryParam = {"%"+placeName+"%"};
		list = getHibernateTemplate().find(hql, queryParam);

		if (list != null && list.size()>0) {
			System.out.println("Places Found");
		}else{
			System.out.println("No Places Found");
		}
		if(list!=null)
			System.out.println("list is :"+list.toString());
		else
			System.out.println("list is null");

		return list;
	}


	@Override
	public boolean deletePlace(PlaceUpdated place) {
		getHibernateTemplate().delete(place);
		return true;
	}

	@Override
	public PlaceUpdated getPlacebyPlaceId(Long placeId) {
		List list = null;

		String query = "from PlaceUpdated place where place.placeId=?";
		Object[] queryParam = {placeId};
		list = getHibernateTemplate().find(query, queryParam);

		if (list != null && list.size()>0) {
			System.out.println("Place Found");
		}			

		System.out.println("Request completed for fetching place by placeId");
		return (list != null && list.size() > 0 ? (PlaceUpdated)list.get(0) : null);
	}

	@Override
	public PlaceUpdated getPlacebyPlaceName(String placeName) {
		List list = null;

		String query = "from PlaceUpdated place where place.placeName=?";
		Object[] queryParam = {placeName};
		list = getHibernateTemplate().find(query, queryParam);

		if (list != null && list.size()>0) {
			System.out.println("Place Found");
		}			

		System.out.println("Request completed for fetching place by placeId");
		return (list != null && list.size() > 0 ? (PlaceUpdated)list.get(0) : null);
	}


	@Override
	public DriverUpdated getDriverByDriverId(Long driverId) {
		List list = null;

		String query = "from DriverUpdated d where d.driverId=?";
		Object[] queryParam = {driverId};
		list = getHibernateTemplate().find(query, queryParam);

		if (list != null && list.size()>0) {
			System.out.println("Driver Found");
		}			

		System.out.println("Request completed for fetching driver by driverId");
		return (list != null && list.size() > 0 ? (DriverUpdated)list.get(0) : null);
	}


	@Override
	public boolean updatePlace(PlaceUpdated place) {
		getHibernateTemplate().update(place);
		return true;		
	}

	@Override
	public boolean updateVehicle(VehicleUpdated v) {
		getHibernateTemplate().update(v);
		return true;		
	}


	@Override
	public boolean deleteRoute(RouteUpdated route) {
		getHibernateTemplate().delete(route);
		return true;
	}

	@Override
	public List<RouteUpdated> getAllRoute() {
		List list = null;

		String hql = "FROM RouteUpdated route";
		list = getHibernateTemplate().find(hql);

		if (list != null && list.size()>0) {
			System.out.println("Route Found");
		}else{
			System.out.println("No Route Found");
		}
		return list;
	}


	@Override
	public List<DriverVehicleMappingUpdated> getAllDriverVehicleMapping() {
		List list = null;

		String hql = "FROM DriverVehicleMappingUpdated dvmu";
		list = getHibernateTemplate().find(hql);

		if (list != null && list.size()>0) {
			System.out.println("DriverVehicleMapping Found");
		}else{
			System.out.println("No DriverVehicleMapping Found");
		}
		return list;
	}


	@Override
	public RouteUpdated getRouteByRouteId(Long routeId) {
		List list = null;

		String query = "from RouteUpdated route where route.routeId=?";
		Object[] queryParam = {routeId};
		list = getHibernateTemplate().find(query, queryParam);

		if (list != null && list.size()>0) {
			System.out.println("Route Found");
		}			

		System.out.println("Request completed for fetching route by routeId");
		return (list != null && list.size() > 0 ? (RouteUpdated)list.get(0) : null);
	}  

	@Override
	public boolean saveRoute(RouteUpdated route) {
		Long routeId = (Long)getHibernateTemplate().save(route);
		if(routeId!=null){
			return true;
		}
		return false;
	}


	@Override
	public boolean saveRouteDriverVehicleMappingUpdated(
			RouteDriverVehicleMappingUpdated rdvmu) {
		Long rdvmuId = (Long)getHibernateTemplate().save(rdvmu);
		if(rdvmuId!=null){
			return true;
		}
		return false;
	}

	@Override
	public boolean updateRouteDriverVehicleMappingUpdated(
			RouteDriverVehicleMappingUpdated rdvmu) {
		getHibernateTemplate().update(rdvmu);
		return true;		
	}

	@Override
	public RouteDriverVehicleMappingUpdated getRouteDriverVehicleMappingUpdatedByRouteId(Long routeId) {

		List list = null;

		String query = "from RouteDriverVehicleMappingUpdated rdvmu where rdvmu.route.routeId=?";
		Object[] queryParam = {routeId};
		list = getHibernateTemplate().find(query, queryParam);

		if (list != null && list.size()>0) {
			System.out.println("RouteDriverVehicleMappingUpdated Found");
		}			

		System.out.println("Request completed for fetching RouteDriverVehicleMappingUpdated by routeId");
		return (list != null && list.size() > 0 ? (RouteDriverVehicleMappingUpdated)list.get(0) : null);
	}  


	@Override
	public boolean updateRoute(RouteUpdated route) {
		getHibernateTemplate().update(route);
		return true;		
	}

	@Override
	public DriverVehicleMappingUpdated getDriverVehicleMappingById(
			Long driverVehicleMappingId) {

		List list = null;

		String query = "from DriverVehicleMappingUpdated dvmu where dvmu.driverVehicleMappingId=?";
		Object[] queryParam = {driverVehicleMappingId};
		list = getHibernateTemplate().find(query, queryParam);

		if (list != null && list.size()>0) {
			System.out.println("DriverVehicleMappingUpdated Found");
		}			

		System.out.println("Request completed for fetching DriverVehicleMappingUpdated by Id");
		return (list != null && list.size() > 0 ? (DriverVehicleMappingUpdated)list.get(0) : null);
	}

	@Override
	public DriverVehicleMappingUpdated getDriverVehicleMappingByDriverId(
			long driverId) {

		List list = null;

		String query = "from DriverVehicleMappingUpdated dvmu where dvmu.driver.driverId=?";
		Object[] queryParam = {driverId};
		list = getHibernateTemplate().find(query, queryParam);

		if (list != null && list.size()>0) {
			System.out.println("DriverVehicleMappingUpdated Found");
		}			

		System.out.println("Request completed for fetching DriverVehicleMappingUpdated by Id");
		return (list != null && list.size() > 0 ? (DriverVehicleMappingUpdated)list.get(0) : null);
	}


	@Override
	public boolean saveDriverVehicleMapping(DriverVehicleMappingUpdated driverVehicleMapping) {
		Long newsId = (Long)getHibernateTemplate().save(driverVehicleMapping);
		if(newsId!=null){
			return true;
		}
		return false;
	}

	@Override
	public boolean deleteRoutePlaceMapping(RoutePlaceMappingUpdated rpmu) {
		getHibernateTemplate().delete(rpmu);
		return true;
	}



	@Override
	public List<RoutePlaceMappingUpdated> getAllRoutePlaceMapping() {
		List list = null;

		String hql = "FROM RoutePlaceMappingUpdated rpmu";
		list = getHibernateTemplate().find(hql);

		if (list != null && list.size()>0) {
			System.out.println("RoutePlaceMappingUpdated Found");
		}else{
			System.out.println("No RoutePlaceMappingUpdated Found");
		}
		return list;
	}

	@Override
	public RoutePlaceMappingUpdated getRoutePlaceMappingById(Long id) {

		List list = null;

		String query = "from RoutePlaceMappingUpdated rpmu where rpmu.routePlaceMappingId=?";
		Object[] queryParam = {id};
		list = getHibernateTemplate().find(query, queryParam);

		if (list != null && list.size()>0) {
			System.out.println("RoutePlaceMappingUpdated Found");
		}			

		System.out.println("Request completed for fetching RoutePlaceMappingUpdated by Id");
		return (list != null && list.size() > 0 ? (RoutePlaceMappingUpdated)list.get(0) : null);
	}


	@Override
	public boolean saveRoutePlaceMapping(RoutePlaceMappingUpdated rpm) {
		Long routePlaceMappingUpdatedId = (Long)getHibernateTemplate().save(rpm);
		if(routePlaceMappingUpdatedId!=null){
			return true;
		}
		return false;
	}

	@Override
	public boolean updateRoutePlaceMapping(RoutePlaceMappingUpdated rpmu) {
		getHibernateTemplate().update(rpmu);
		return true;		
	}

	@Override
	public UserRouteMappingUpdated getUserRouteMappingByUser(
			UserUpdated user) {

		List list = null;

		String query = "from UserRouteMappingUpdated urmu where urmu.user=?";
		Object[] queryParam = {user};
		list = getHibernateTemplate().find(query, queryParam);

		if (list != null && list.size()>0) {
			System.out.println("UserRouteMappingUpdated Found");
		}			

		System.out.println("Request completed for fetching UserRouteMappingUpdated by user");
		return (list != null && list.size() > 0 ? (UserRouteMappingUpdated)list.get(0) : null);
	}

	@Override
	public boolean deleteUserRouteMappingByUserRouteMapping(UserRouteMappingUpdated userRouteMappingUpdated) {
		getHibernateTemplate().delete(userRouteMappingUpdated);
		return true;
	}


	@Override
	public boolean deleteUserRequestNew(UserRequestNew userRequestNew) {
		getHibernateTemplate().delete(userRequestNew);
		return true;	
	}

	@Override
	public boolean modifyUserRequestNew(UserRequestNew userRequestNew) {
		getHibernateTemplate().update(userRequestNew);
		return true;
	}

	@Override
	public boolean saveUserRequestNew(UserRequestNew userRequestNew) {
		Long requestId = (Long)getHibernateTemplate().save(userRequestNew);
		if(requestId!=null){
			return true;
		}
		return false;
	}

	@Override
	public List<UserRequestNew> getAllUserRequestNewWithStatusPending() {
		List list = null;

		String hql = "FROM UserRequestNew urn where urn.requestStatus="+TransportConstants.REQUEST_PENDING;
		list = getHibernateTemplate().find(hql);

		if (list != null && list.size()>0) {
			System.out.println("UserRequestNew Found");
		}else{
			System.out.println("No UserRequestNew Found");
		}
		return list;
	}	

	@Override
	public List<UserRequestNew> getAllUserRequestNewWithEmailId(String emailId) {
		List list = null;

		String hql = "FROM UserRequestNew urn where urn.emailId=?";
		Object[] queryParam = {emailId};
		list = getHibernateTemplate().find(hql, queryParam);

		if (list != null && list.size()>0) {
			System.out.println("UserRequestNew Found");
		}else{
			System.out.println("No UserRequestNew Found");
		}
		return list;
	}


	@Override
	public UserRequestNew getUserRequestNewWithMatchingEmailIdAndRequestId(String emailId, long requestId) {
		List list = null;

		String hql = "FROM UserRequestNew urn where urn.emailId=? and urn.requestId=?";
		Object[] queryParam = {emailId, requestId};
		list = getHibernateTemplate().find(hql, queryParam);

		if (list != null && list.size()>0) {
			System.out.println("UserRequestNew Found");
		}else{
			System.out.println("No UserRequestNew Found");
		}

		System.out.println("Request completed for fetching UserRouteMappingUpdated by user");
		return (list != null && list.size() > 0 ? (UserRequestNew)list.get(0) : null);
	}

	@Override
	public UserRequestNew getUserRequestNewWithMatchingEmailId(String emailId) {
		List list = null;

		String hql = "FROM UserRequestNew urn where urn.emailId=?";
		Object[] queryParam = {emailId};
		list = getHibernateTemplate().find(hql, queryParam);

		if (list != null && list.size()>0) {
			System.out.println("UserRequestNew Found");
		}else{
			System.out.println("No UserRequestNew Found");
		}

		System.out.println("Request completed for fetching UserRouteMappingUpdated by user");
		return (list != null && list.size() > 0 ? (UserRequestNew)list.get(0) : null);
	}


	@Override
	public List<RouteDriverVehicleMappingUpdated> getListOfRouteDriverVehicleMappingUpdated() {
		List list = null;

		String hql = "FROM RouteDriverVehicleMappingUpdated rdvmu";
		list = getHibernateTemplate().find(hql);

		if (list != null && list.size()>0) {
			System.out.println("RouteDriverVehicleMappingUpdated Found");
		}			
		return list;
	}

	@Override
	public List<List<UserRouteMappingUpdated>> getAllUserRouteMapping() {

		List<List<UserRouteMappingUpdated>> listOfUserRouteMappingUpdated = new ArrayList<List<UserRouteMappingUpdated>>();

		List<RouteUpdated> listOfAllRoute = getAllRoute();
		if(listOfAllRoute!=null && listOfAllRoute.size()>0){
			for(int i=0;i<listOfAllRoute.size();i++){
				RouteUpdated ru = listOfAllRoute.get(i);
				List<UserRouteMappingUpdated> lurmu = getAllUserByRoute(ru.getRouteName());
				listOfUserRouteMappingUpdated.add(lurmu);
			}
		}

		return listOfUserRouteMappingUpdated;
	}

	@Override
	public List<UserRequestNew> getAllUserRequestNewHavingStatus(int statusId) {
		List list = null;

		String hql = "FROM UserRequestNew urn where urn.requestStatus=?";
		Object[] queryParam = {statusId};
		list = getHibernateTemplate().find(hql, queryParam);

		if (list != null && list.size()>0) {
			System.out.println("UserRequestNew Found");
		}else{
			System.out.println("No UserRequestNew Found");
		}

		return list;
	}


	@Override
	public boolean deleteBusFare(BusFare busFare) {
		getHibernateTemplate().delete(busFare);
		return true;
	}

	@Override
	public BusFare getBusFare(int routeId) {
		List list = null;

		String hql = "FROM BusFare bf where bf.routeId=?";
		Object[] queryParam = {routeId};
		list = getHibernateTemplate().find(hql, queryParam);

		if (list != null && list.size()>0) {
			System.out.println("BusFare Found");
		}			
		return (list != null && list.size() > 0 ? (BusFare)list.get(0) : null);
	}

	@Override
	public boolean modifyBusFare(BusFare busFare) {
		getHibernateTemplate().update(busFare);
		return true;
	}

	@Override
	public boolean saveBusFare(BusFare busFare) {
		Long requestId = (Long)getHibernateTemplate().save(busFare);
		if(requestId!=null){
			return true;
		}
		return false;
	}


	@Override
	public List<FeedbackUpdated> getFeedbackByType(int feedbackType) {

		System.out.println("Request received for fetching Feedback by type :"+feedbackType);
		List list = null;
		try{

			if(feedbackType>0){
				list = getHibernateTemplate().findByNamedQueryAndNamedParam("getFeedbackByType","feedbackType",feedbackType);
			}else{
				list = getHibernateTemplate().findByNamedQuery("getAllFeedback");
			}

			if(list!=null)
				System.out.println("Fetched feedback result is :"+list.toString());
			else
				System.out.println("List is null");

			System.out.println("Returning back from fetching Feedback by type");

			return list;
		}catch(Exception e){
			System.out.println("Exception Occurred while fetching Feedback by type :"+e.getMessage());
		}
		return null;
	}

	@Override
	public List<FeedbackUpdated> getActiveFeedbackByType(int feedbackType) {

		System.out.println("Request received for fetching active Feedback by type :"+feedbackType);
		List list = null;
		try{

			if(feedbackType>0){
				list = getHibernateTemplate().findByNamedQueryAndNamedParam("getActiveFeedbackByType","feedbackType",feedbackType);
			}else{
				list = getHibernateTemplate().findByNamedQuery("getAllActiveFeedback");
			}

			if(list!=null)
				System.out.println("Fetched active feedback result is :"+list.toString());
			else
				System.out.println("List is null");

			System.out.println("Returning back from fetching Feedback by type");

			return list;
		}catch(Exception e){
			System.out.println("Exception Occurred while fetching active Feedback by type :"+e.getMessage());
			System.out.println("Exception Occurred while fetching active Feedback by type :"+e.getMessage());
			e.printStackTrace();
		}
		return null;
	}



	@Override
	public boolean saveFeedback(FeedbackUpdated feedbackUpdated) {
		try{
			System.out.println("Request received to save Feedback :"+feedbackUpdated);

			Long feedBackId = (Long)getHibernateTemplate().save(feedbackUpdated);
			if(feedBackId!=null){
				return true;
			}
			System.out.println("Request completed to save Feedback");
		}catch (Exception e) {
			System.out.println("Exception occured while saving feedback :"+e.getMessage());
		}
		return false;
	}


}
