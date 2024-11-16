import 'package:flight_maintenance_app/bloc/checkList/checklist_bloc.dart';
import 'package:flight_maintenance_app/models/aircraft_model.dart';
import 'package:flight_maintenance_app/models/aircraft_steps.dart';
import 'package:flight_maintenance_app/utils/aircraftlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

class Propeller extends StatefulWidget {
  const Propeller({super.key});

  @override
  State<Propeller> createState() => _PropellerState();
}

class _PropellerState extends State<Propeller> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCommonAppBar(context, 'Propeller'),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: aircrafSteps.length,
                itemBuilder: (context, index) {
                  final step = aircrafSteps[index];

                  return AircraftCard(aircraftStep: step);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.red[800],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Reset Confirmation'),
                        content: const Text(
                            'Are you sure you want to reset the checklist?'),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('Cancel'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            child: const Text('Yes'),
                            onPressed: () {
                              context
                                  .read<ChecklistBloc>()
                                  .add(ResetChecklist());

                              for (var step in aircrafSteps) {
                                step.isComplete = false;
                              }

                              setState(() {});

                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Text('Reset Checklist'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AircraftCard extends StatelessWidget {
  final AircraftSteps aircraftStep;

  const AircraftCard({
    super.key,
    required this.aircraftStep,
  });

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
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                child: Image.asset(
                  aircraftStep.imagePath,
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              ListTile(
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
            ],
          ),
        ),
      ),
    );
  }
}


