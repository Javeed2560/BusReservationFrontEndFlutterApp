import 'package:bus_reservation_app/models/bus_model.dart';
import 'package:bus_reservation_app/models/bus_route.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bus_schedule.freezed.dart';

part 'bus_schedule.g.dart';

@unfreezed
class BusSchedule with _$BusSchedule {
  factory BusSchedule({
    int? scheduleId,
    required Bus bus,
    required BusRoute busRoute,
    required String departureTime,
    required int ticketPrice,
    @Default(0) int discount,
    @Default(250) int processingFee,
  }) = _BusSchedule;

  factory BusSchedule.fromJson(Map<String, dynamic> json) =>
      _$BusScheduleFromJson(json);
}
