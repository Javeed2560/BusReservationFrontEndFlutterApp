import 'package:bus_reservation_app/models/bus_model.dart';
import 'package:bus_reservation_app/models/bus_reservation.dart';
import 'package:bus_reservation_app/models/bus_route.dart';
import 'package:bus_reservation_app/models/bus_schedule.dart';
import 'package:bus_reservation_app/utils/constants.dart';

class TempDB {
  static List<Bus> tableBus = [
    Bus(
        busId: 1,
        busName: 'Test Bus-1',
        busNumber: 'Test-007',
        busType: busTypeACBusiness,
        totalSeat: 25),
    Bus(
        busId: 2,
        busName: 'Test Bus-2',
        busNumber: 'Test-Ap-16-42',
        busType: busTypeACEconomy,
        totalSeat: 32),
    Bus(
        busId: 3,
        busName: 'Test Bus-3',
        busNumber: 'TEst-Ap-37-04',
        busType: busTypeNonAc,
        totalSeat: 40),
  ];

  static List<BusRoute> tableRoute = [
    BusRoute(
        routeId: 1,
        routeName: 'Eluru-Ongole',
        cityFrom: 'Eluru ',
        cityTo: 'Ongole',
        distanceInKm: 260),
    BusRoute(
        routeId: 2,
        routeName: 'Rajahmundry-Tirupati',
        cityFrom: 'Rajahmundry',
        cityTo: 'Tirupati',
        distanceInKm: 230),
    BusRoute(
        routeId: 3,
        routeName: 'Visakhapatnam-Vijayawada',
        cityFrom: 'Visakhapatnam',
        cityTo: 'Vijayawada',
        distanceInKm: 280),
  ];

  static List<BusSchedule> tableSchedule = [
    BusSchedule(
        scheduleId: 1,
        bus: tableBus[0],
        busRoute: tableRoute[0],
        departureTime: '05:20',
        ticketPrice: 2650),
    BusSchedule(
        scheduleId: 2,
        bus: tableBus[1],
        busRoute: tableRoute[1],
        departureTime: '04:00',
        ticketPrice: 1950),
    BusSchedule(
        scheduleId: 3,
        bus: tableBus[0],
        busRoute: tableRoute[2],
        departureTime: '06:30',
        ticketPrice: 1250),
  ];
  static List<BusReservation> tableReservation = [];
}
