import 'package:flight_maintenance_app/utils/aircraftlist.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

AppBar buildCommonAppBar(BuildContext context, String title) {
  return AppBar(
    title: Text(
      title,
      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
    ),
    backgroundColor: Colors.blueGrey[400],
    centerTitle: true,
    leading: IconButton(
      icon: const Icon(Icons.arrow_back),
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
      body: ListView.builder(
        itemCount: aircrafSteps.length,
        itemBuilder: (context, index) {
          final step = aircrafSteps[index];
          return Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: ElevatedButton(
              onPressed: step.isAvailable
                  ? () {
                      GoRouter.of(context).go(step.route);
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: step.isAvailable ? Colors.blue : Colors.grey,
              ),
              child: Text(
                step.name,
                style: TextStyle(
                  color: step.isAvailable ? Colors.white : Colors.black45,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
