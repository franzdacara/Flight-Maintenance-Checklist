import 'package:flight_maintenance_app/models/aircraft_model.dart';
import 'package:flight_maintenance_app/models/aircraft_steps.dart';
import 'package:flight_maintenance_app/utils/aircraftlist.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

AppBar buildCommonAppBar(BuildContext context, String title) {
  return AppBar(
    title: Text(
      title,
      style: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    backgroundColor: Colors.blueGrey[400],
    centerTitle: true,
    leading: IconButton(
      icon: const Icon(Icons.arrow_back, color: Colors.white),
      onPressed: () {
        GoRouter.of(context).go('/');
      },
    ),
  );
}

class Propeller extends StatelessWidget {
  const Propeller({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCommonAppBar(context, 'Propeller'),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: ListView.builder(
          itemCount: aircrafSteps.length,
          itemBuilder: (context, index) {
            final step = aircrafSteps[index];
        
            return AircraftCard(aircraftStep: step);
          },
        ),
      ),
    );
  }
}

class AircraftCard extends StatelessWidget {
  final AircraftSteps aircraftStep;

  const AircraftCard({super.key, required this.aircraftStep});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (aircraftStep.isAvailable) {
          GoRouter.of(context).go(aircraftStep.route);
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 3,
          child: ListTile(
            title: Text(
              aircraftStep.name,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
            leading: Icon(
              aircraftStep.isAvailable ? Icons.check_circle : Icons.cancel,
              color: aircraftStep.isComplete ? Colors.green : Colors.red, 
              size: 30,
            ),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            tileColor: Colors.blueGrey[100],
            textColor: Colors.black,
            iconColor: Colors.black,
            subtitle: Text(
              aircraftStep.isComplete ? 'Complete' : 'Incomplete',
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

