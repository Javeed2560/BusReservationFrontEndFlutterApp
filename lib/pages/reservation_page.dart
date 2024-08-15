import 'package:bus_reservation_app/customwidgets/reservation_item_body_view.dart';
import 'package:bus_reservation_app/customwidgets/reservationt_item_header_view.dart';
import 'package:bus_reservation_app/customwidgets/search_box.dart';
import 'package:bus_reservation_app/models/reservation_expansion_item.dart';
import 'package:bus_reservation_app/providers/app_data_provider.dart';
import 'package:bus_reservation_app/utils/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReservationPage extends StatefulWidget {
  const ReservationPage({super.key});

  @override
  State<ReservationPage> createState() => _ReservationPageState();
}

class _ReservationPageState extends State<ReservationPage> {
  bool isFirst = true;
  List<ReservationExpansionItem> items = [];
  @override
  void didChangeDependencies() {
    if (isFirst) {
      _getData();
    }
    super.didChangeDependencies();
  }

  _getData() async {
    final reservations =
        await Provider.of<AppDataProvider>(context, listen: false)
            .getAllReservations();
    items = Provider.of<AppDataProvider>(context, listen: false)
        .getExpansionItems(reservations);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reservation List'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SearchBox(
              onSubmit: (value) {
                _search(value);
              },
            ),
            ExpansionPanelList(
              expansionCallback: (index, isExpanded) {
                setState(() {
                  items[index].isExpanded = !isExpanded;
                });
              },
              children: items
                  .map(
                    (item) => ExpansionPanel(
                      headerBuilder: (context, isExpanded) =>
                          ReservationtItemHeaderView(header: item.header),
                      body: ReservationItemBodyView(body: item.body),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  void _search(String value) async {
    final data = await Provider.of<AppDataProvider>(context, listen: false)
        .getReservationsByMobike(value);
    if (data.isEmpty) {
      showMsg(context, 'No Record found');
      return;
    }
    setState(() {
      items = Provider.of<AppDataProvider>(context, listen: false)
          .getExpansionItems(data);
    });
  }
}
