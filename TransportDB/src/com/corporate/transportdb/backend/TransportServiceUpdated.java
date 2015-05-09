package com.corporate.transportdb.backend;

import java.util.List;

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

public interface TransportServiceUpdated {
	List<UserUpdated> getAllUserUpdated();
	boolean deleteUserUpdated(UserUpdated user);
	UserUpdated getUserByUserName(String userName);
	UserUpdated getUserByUserId(Long userId);
	
	
	//USER-ROUTE RELATED QUERIES
	UserRouteMappingUpdated getUserRouteMappingByUser(UserUpdated user);
	List<List<UserRouteMappingUpdated>> getAllUserRouteMapping();
	boolean deleteUserRouteMappingByUserRouteMapping(UserRouteMappingUpdated user);
	boolean saveUserRouteMapping(UserRouteMappingUpdated userRouteMapping);
	boolean updateUserRouteMapping(UserRouteMappingUpdated userRouteMapping);
	
	
	List<UserRouteMappingUpdated> getAllUserByRoute(String routeName);
	RouteDetailsHelper getCompleteTravellerDetailsByRoute(String routeName, String cabType);
	
//	List<RouteDetailsUpdated> getAllRouteDetailsWithInBetweenPlaces(String nightCabOrRegular);

	

//	List<UserRouteMappingForNightCabUpdated> getUserBookedNightCabOnDate(String dateOfBooking);	
	UserUpdated getUserByEmailId(String emailId);

	
	//NEWS RELATED QUERIES
	List<News> getAllActiveNews();
	List<News> getAllNews();
	boolean deleteNews(News news);
	News getNewsByNewsId(long newsId);
	boolean saveNews(News news);
	boolean updateNews(News news);
		
	
//	boolean enableMonthlyBusPassToUserForRoute(UserUpdated user, RouteUpdated route);
	
	Role getRoleByRoleName(String roleName);
	Status getStatusByName(String statusName);
	boolean saveUser(UserUpdated user);
//	
//	boolean saveVehicleDetailsWithDriver(DriverUpdated driverUpdated);
//	boolean saveRoute(RouteUpdated routeUpdated);
//	boolean updateRoute(RouteUpdated routeUpdated);

	
	//PLACE RELATED QUERIES
	boolean savePlace(PlaceUpdated place);
	List<PlaceUpdated> getAllPlace();
	PlaceUpdated getPlacebyPlaceId(Long PlaceId);
	PlaceUpdated getPlacebyPlaceName(String placeName);
	boolean updatePlace(PlaceUpdated place);
	boolean deletePlace(PlaceUpdated place);
	List<PlaceUpdated> getAllPlaceMatchingWithGivenWord(String placeName);
	
	
	//ROUTE RELATED QUERIES
	boolean saveRoute(RouteUpdated route);
	List<RouteUpdated> getAllRoute();
	RouteUpdated getRouteByRouteName(String routeName);
	RouteUpdated getRouteByRouteId(Long routeId);
	boolean updateRoute(RouteUpdated route);
	boolean deleteRoute(RouteUpdated route);
	
	List<RouteDetailsHelper> getAllRouteDetailsWithAllUserAndInBetweenPlaces(String nightCabOrRegular);
	List<RouteDetailsHelper> getAllRouteDetailsWithInBetweenPlacesAndRouteDriverVehicleMapping(String nightCabOrRegular);
	RouteDetailsHelper getAllRouteDetailsWithInBetweenPlacesAndRouteDriverVehicleMappingByRouteId(Long routeId, String nightCabOrRegular);

	
	//ROUTE-PLACE RELATED QUERIES
	boolean saveRoutePlaceMapping(RoutePlaceMappingUpdated rpm);
	List<RoutePlaceMappingUpdated> getAllRoutePlaceMapping();
	RoutePlaceMappingUpdated getRoutePlaceMappingById(Long id);
	boolean updateRoutePlaceMapping(RoutePlaceMappingUpdated rpm);
	boolean deleteRoutePlaceMapping(RoutePlaceMappingUpdated rpm);
	RouteDetailsHelper getAllInBetweenPlaceOfRouteByRouteName(String routeName);
	public List<RoutePlaceMappingUpdated> getAllInBetweenPlaceOfRouteByRouteId(Long routeId);
	
	public boolean deleteAllInBetweenPlaceOfRouteByRouteId(Long routeId);
	//public boolean deleteAllInBetweenPlaceOfRouteByRouteObject(RouteUpdated route);
	
	
	//VEHICLE RELATED QUERIES
	boolean saveVehicle(VehicleUpdated v);
	List<VehicleUpdated> getAllVehicles();
	VehicleUpdated getVehicleByVehicleId(Long vehicleId);
	boolean deleteVehicle(VehicleUpdated v);
	boolean updateVehicle(VehicleUpdated v);
	
	//DRIVER RELATED QUERIES
	boolean saveDriver(DriverUpdated driver);
	boolean updateDriver(DriverUpdated driver);
	boolean deleteDriver(DriverUpdated driver);
	List<DriverUpdated> getAllDriver();
	DriverUpdated getDriverByDriverId(Long driverId);
	
	
	//DRIVER-VEHICLE RELATED QUERIES
	List<DriverVehicleMappingUpdated> getAllDriverVehicleMapping();
	DriverVehicleMappingUpdated getDriverVehicleMappingById(Long driverVehicleMappingId);
	DriverVehicleMappingUpdated getDriverVehicleMappingByDriverId(long driverId);
	boolean saveDriverVehicleMapping(DriverVehicleMappingUpdated driverVehicleMapping);
	
	//ROUTE-DRIVER-VEHICLE RELATED QUERIES
	boolean saveRouteDriverVehicleMappingUpdated(RouteDriverVehicleMappingUpdated rdvmu);
	RouteDriverVehicleMappingUpdated getRouteDriverVehicleMappingUpdatedByRouteId(Long routeId);
	boolean updateRouteDriverVehicleMappingUpdated(RouteDriverVehicleMappingUpdated rdvmu);
	List<RouteDriverVehicleMappingUpdated> getListOfRouteDriverVehicleMappingUpdated();
	
//	boolean deleteDriverByVehicleId(Long vehicleId);
//	boolean deleteRouteByRouteId(Long routeId);
//	boolean deleteAllInBetweenPlacesOfRouteByRouteId(Long routeId);
	
//	DriverUpdated getDriverByVehicleId(Long vehicleId);
	
	//NIGHTCAB BOOKING
	boolean saveUserRouteMappingForNightCabUpdatedDetails(UserRouteMappingForNightCabUpdated userRouteMappingForNightCabUpdated);
	boolean deleteUserRouteMappingForNightCabUpdatedDetailsByUserId(long userId);
	
	
	//BUS PASS API
	boolean saveUserRequestNew(UserRequestNew userRequestNew);
	boolean deleteUserRequestNew(UserRequestNew userRequestNew);
	boolean modifyUserRequestNew(UserRequestNew userRequestNew);
	List<UserRequestNew> getAllUserRequestNewWithStatusPending();
	List<UserRequestNew> getAllUserRequestNewWithEmailId(String emailId);
	UserRequestNew getUserRequestNewWithMatchingEmailIdAndRequestId(String emailId, long requestId);
	UserRequestNew getUserRequestNewWithMatchingEmailId(String emailId);
	
	List<UserRequestNew> getAllUserRequestNewHavingStatus(int statusId);
	
	//BUS FARE API
	boolean saveBusFare(BusFare busFare);
	boolean deleteBusFare(BusFare busFare);
	boolean modifyBusFare(BusFare busFare);
	BusFare getBusFare(int routeId);
	
	
	boolean saveFeedback(FeedbackUpdated feedbackUpdated);
	List<FeedbackUpdated> getFeedbackByType(int feedbackType);
	List<FeedbackUpdated> getActiveFeedbackByType(int feedbackType);
}
