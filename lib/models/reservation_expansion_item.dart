import 'package:bus_reservation_app/models/bus_schedule.dart';
import 'package:bus_reservation_app/models/customer.dart';

class ReservationExpansionItem {
  ReservationExpansionHeader header;
  ReservationExpansionBody body;
  bool isExpanded;

  ReservationExpansionItem({
    required this.body,
    required this.header,
    this.isExpanded = false,
  });
}

class ReservationExpansionHeader {
  int? reservationId;
  String departureDate;
  BusSchedule schedule;
  int timestamp;
  String reservationStatus;

  ReservationExpansionHeader({
    required this.reservationId,
    required this.departureDate,
    required this.schedule,
    required this.timestamp,
    required this.reservationStatus,
  });
}

class ReservationExpansionBody {
  Customer customer;
  int totalSeatBooked;
  String seatNumbers;
  int totalPrice;

  ReservationExpansionBody({
    required this.customer,
    required this.seatNumbers,
    required this.totalPrice,
    required this.totalSeatBooked,
  });
}
