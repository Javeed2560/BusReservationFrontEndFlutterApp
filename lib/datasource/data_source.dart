import 'package:bus_reservation_app/models/app_user.dart';
import 'package:bus_reservation_app/models/auth_response_model.dart';
import 'package:bus_reservation_app/models/bus_model.dart';
import 'package:bus_reservation_app/models/bus_reservation.dart';
import 'package:bus_reservation_app/models/bus_route.dart';
import 'package:bus_reservation_app/models/bus_schedule.dart';
import 'package:bus_reservation_app/models/response_model.dart';

abstract class DataSource {
  Future<AuthResponseModel?> login(AppUser user);
  Future<ResponseModel> addBus(Bus bus);
  Future<List<Bus>> getAllBus();
  Future<ResponseModel> addRoute(BusRoute busRoute);
  Future<List<BusRoute>> getAllRoutes();
  Future<BusRoute?> getRouteByCityFromAndCityTo(String cityFrom, String cityTo);
  Future<ResponseModel> addSchedule(BusSchedule busSchedule);
  Future<List<BusSchedule>> getAllSchedules();
  Future<List<BusSchedule>> getSchedulesByRouteName(String routeName);
  Future<ResponseModel> addReservation(BusReservation reservation);
  Future<List<BusReservation>> getAllReservation();
  Future<List<BusReservation>> getReservationsByMobile(String mobile);
  Future<List<BusReservation>> getReservationsByScheduleAndDepartureDate(
      int scheduleId, String departureDate);
}
