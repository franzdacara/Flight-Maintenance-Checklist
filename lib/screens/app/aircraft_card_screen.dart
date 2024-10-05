import 'package:flight_maintenance_app/models/aircraft_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AircraftCard extends StatelessWidget {
  final Aircraft aircraft;

  const AircraftCard({super.key, required this.aircraft});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (aircraft.isAvailable) {
          GoRouter.of(context).go(aircraft.route);
        }
      },
      child: Card(
        child: ListTile(
          title: Text(
            aircraft.name,
            style: const TextStyle(fontSize: 13),
          ),
          leading: Icon(
            Icons.airplane_ticket_rounded,
            color: aircraft.isAvailable ? Colors.green : Colors.red,
          ),
          trailing: const Icon(Icons.arrow_forward_ios_rounded),
          tileColor: Colors.blueGrey[100],
          textColor: Colors.black,
          iconColor: Colors.black,
          subtitle: Text(
            'Status: ${aircraft.isAvailable ? 'Available' : 'Not Available'}',
            style: const TextStyle(fontSize: 12),
          ),
        ),
      ),
    );
  }
}
