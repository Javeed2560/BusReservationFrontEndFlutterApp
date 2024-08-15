import 'package:bus_reservation_app/pages/booking_confirmation_page.dart';
import 'package:bus_reservation_app/pages/add_bus_page.dart';
import 'package:bus_reservation_app/pages/add_route_page.dart';
import 'package:bus_reservation_app/pages/add_schedule_page.dart';
import 'package:bus_reservation_app/pages/login_page.dart';
import 'package:bus_reservation_app/pages/reservation_page.dart';
import 'package:bus_reservation_app/pages/search_page.dart';
import 'package:bus_reservation_app/pages/search_result_page.dart';
import 'package:bus_reservation_app/pages/seat_plan_page.dart';
import 'package:bus_reservation_app/providers/app_data_provider.dart';
import 'package:bus_reservation_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => AppDataProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reservation App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        brightness: Brightness.dark,
      ),
      initialRoute: routeNameHome,
      routes: {
        routeNameHome: (context) => const SearchPage(),
        routeNameSearchResultPage: (context) => const SearchResultPage(),
        routeNameSeatPlanPage: (context) => const SeatPlanPage(),
        routeNameBookingConfirmationPage: (context) =>
            const BookingConfirmationPage(),
        routeNameAddBusPage: (context) => const AddBusPage(),
        routeNameAddRoutePage: (context) => const AddRoutePage(),
        routeNameAddSchedulePage: (context) => const AddSchedulePage(),
        routeNameReservationPage: (context) => const ReservationPage(),
        routeNameLoginPage: (context) => const LoginPage(),
      },
    );
  }
}
