import 'package:bus_reservation_app/models/bus_schedule.dart';
import 'package:bus_reservation_app/models/customer.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bus_reservation.freezed.dart';

part 'bus_reservation.g.dart';

@unfreezed
class BusReservation with _$BusReservation {
  factory BusReservation({
    int? reservationId,
    required Customer customer,
    required BusSchedule busSchedule,
    required int timestamp,
    required String departureDate,
    required int totalSeatBooked,
    required String seatNumbers,
    required String reservationStatus,
    required int totalPrice,
  }) = _BusReservation;

  factory BusReservation.fromJson(Map<String, dynamic> json) =>
      _$BusReservationFromJson(json);
}
