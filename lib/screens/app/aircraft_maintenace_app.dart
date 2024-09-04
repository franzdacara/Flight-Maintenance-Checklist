import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// ignore: depend_on_referenced_packages
import 'package:logger/logger.dart';
import 'package:flight_maintenance_app/models/aircraft_model.dart';

class AircraftMaintenanceAppMainScreen extends StatefulWidget {
  const AircraftMaintenanceAppMainScreen({super.key});

  @override
  State<AircraftMaintenanceAppMainScreen> createState() =>
      _AircraftMaintenanceAppMainScreenState();
}

class _AircraftMaintenanceAppMainScreenState
    extends State<AircraftMaintenanceAppMainScreen> {
  final List<Aircraft> aircraftList = [
    Aircraft(name: 'Cessna 172', isAvailable: true, route: '/cessna172'),
    Aircraft(
        name: 'Piper PA-28 Cherokee', isAvailable: false, route: '/piperPa28'),
    Aircraft(
        name: 'Beechcraft Bonanza',
        isAvailable: false,
        route: '/beechcraftBonanza'),
    Aircraft(name: 'Cirrus SR22', isAvailable: false, route: '/cirrusSr22'),
    Aircraft(name: 'Diamond DA40', isAvailable: false, route: '/diamondDa40'),
    Aircraft(name: 'Mooney M20', isAvailable: false, route: '/mooneyM20'),
    Aircraft(name: 'Grumman Tiger', isAvailable: false, route: '/grummanTiger'),
    Aircraft(name: 'Tecnam P2006T', isAvailable: false, route: '/tecnamP2006t'),
    Aircraft(
        name: 'Alpha Robin DR400',
        isAvailable: false,
        route: '/alphaRobinDr400'),
    Aircraft(
        name: 'Aero Commander 680',
        isAvailable: false,
        route: '/aeroCommander680'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text('Select Aircraft to Check Status'),
      centerTitle: true,
      backgroundColor: Colors.blueGrey[400],
      titleTextStyle:
          const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: aircraftList.length,
              itemBuilder: (context, index) {
                final aircraft = aircraftList[index];
                return AircraftCard(aircraft: aircraft);
              },
            ),
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}

class AircraftCard extends StatelessWidget {
  final Aircraft aircraft;

  const AircraftCard({super.key, required this.aircraft});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Logger().e("Tapped on ${aircraft.name}");
        if (aircraft.isAvailable) {
          context.go(aircraft.route);
        }
      },
      child: Card(
        child: ListTile(
          title: Text(
            aircraft.name,
            style: const TextStyle(fontSize: 13),
          ),
          leading: Icon(
            Icons.airplane_ticket,
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
