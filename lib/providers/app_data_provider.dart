import 'package:bus_reservation_app/datasource/app_data_source.dart';
import 'package:bus_reservation_app/datasource/data_source.dart';
import 'package:bus_reservation_app/models/app_user.dart';
import 'package:bus_reservation_app/models/auth_response_model.dart';
import 'package:bus_reservation_app/models/bus_model.dart';
import 'package:bus_reservation_app/models/bus_reservation.dart';
import 'package:bus_reservation_app/models/bus_route.dart';
import 'package:bus_reservation_app/models/reservation_expansion_item.dart';
import 'package:bus_reservation_app/models/response_model.dart';
import 'package:bus_reservation_app/utils/helper_functions.dart';
import 'package:flutter/material.dart';

import '../models/bus_schedule.dart';

class AppDataProvider extends ChangeNotifier {
  List<Bus> _busList = [];
  List<BusRoute> _routeList = [];
  List<BusReservation> _reservationList = [];
  List<BusSchedule> _scheduleList = [];
  List<BusSchedule> get scheduleList => _scheduleList;
  List<Bus> get busList => _busList;
  List<BusReservation> get reservationList => _reservationList;
  List<BusRoute> get routeList => _routeList;
  final DataSource _dataSource = AppDataSource();

  Future<AuthResponseModel?> login(AppUser user) async {
    final response = await _dataSource.login(user);
    if (response == null) return null;
    await saveToken(response.accessToken);
    await saveLoginTime(response.loginTime as int);
    await saveExpirationDuration(response.expirationDuration as int);

    return response;
  }

  Future<ResponseModel> addBus(Bus bus) {
    return _dataSource.addBus(bus);
  }

  Future<ResponseModel> addRoute(BusRoute route) {
    return _dataSource.addRoute(route);
  }

  Future<ResponseModel> addSchedule(BusSchedule busSchedule) {
    return _dataSource.addSchedule(busSchedule);
  }

  Future<ResponseModel> addReservation(BusReservation reservation) {
    return _dataSource.addReservation(reservation);
  }

  Future<void> getAllBus() async {
    _busList = await _dataSource.getAllBus();
    notifyListeners();
  }

  Future<void> getAllBusRoutes() async {
    _routeList = await _dataSource.getAllRoutes();
    notifyListeners();
  }

  Future<List<BusReservation>> getAllReservations() async {
    _reservationList = await _dataSource.getAllReservation();
    notifyListeners();
    return _reservationList;
  }

  Future<List<BusReservation>> getReservationsByMobike(String mobile) {
    return _dataSource.getReservationsByMobile(mobile);
  }

  Future<BusRoute?> getRouteByCityFromAndCityTo(
      String cityFrom, String cityTo) {
    return _dataSource.getRouteByCityFromAndCityTo(cityFrom, cityTo);
  }

  Future<List<BusSchedule>> getScheduleByRouteName(String routeName) async {
    return _dataSource.getSchedulesByRouteName(routeName);
  }

  Future<List<BusReservation>> getReservationsByScheduleAndDepartureDate(
      int scheduleId, String departureDate) {
    return _dataSource.getReservationsByScheduleAndDepartureDate(
        scheduleId, departureDate);
  }

  List<ReservationExpansionItem> getExpansionItems(
      List<BusReservation> reservationList) {
    return List.generate(reservationList.length, (index) {
      final reservation = reservationList[index];
      return ReservationExpansionItem(
        body: ReservationExpansionBody(
          customer: reservation.customer,
          seatNumbers: reservation.seatNumbers,
          totalPrice: reservation.totalPrice,
          totalSeatBooked: reservation.totalSeatBooked,
        ),
        header: ReservationExpansionHeader(
          reservationId: reservation.reservationId,
          departureDate: reservation.departureDate,
          schedule: reservation.busSchedule,
          timestamp: reservation.timestamp,
          reservationStatus: reservation.reservationStatus,
        ),
      );
    });
  }
}
