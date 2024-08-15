import 'package:bus_reservation_app/models/reservation_expansion_item.dart';
import 'package:bus_reservation_app/utils/constants.dart';
import 'package:flutter/material.dart';

class ReservationItemBodyView extends StatelessWidget {
  final ReservationExpansionBody body;
  const ReservationItemBodyView({required this.body, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Customer Name: ${body.customer.customerName}'),
          Text('Customer Mobile: ${body.customer.mobile}'),
          Text('Customer Email: ${body.customer.email}'),
          Text('Total Seat: ${body.totalSeatBooked}'),
          Text('Seat Numbers: ${body.seatNumbers}'),
          Text('Total Price: $currency${body.totalPrice}'),
        ],
      ),
    );
  }
}
