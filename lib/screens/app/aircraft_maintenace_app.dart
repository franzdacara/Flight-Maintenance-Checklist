import 'package:flight_maintenance_app/screens/aircraft_list/aero/aero_commander_680_screen.dart';
import 'package:flight_maintenance_app/screens/aircraft_list/beechcraft/beechcraft_bonanza_screen.dart';
import 'package:flight_maintenance_app/screens/aircraft_list/cessna/cessna_172_screen.dart';
import 'package:flight_maintenance_app/screens/aircraft_list/cirrus/cirrus_sr22_screen.dart';
import 'package:flight_maintenance_app/screens/aircraft_list/diamond/diamond_da40_screen.dart';
import 'package:flight_maintenance_app/screens/aircraft_list/grumman/grumman_tiger_screen.dart';
import 'package:flight_maintenance_app/screens/aircraft_list/mooney/mooney_m20_screen.dart';
import 'package:flight_maintenance_app/screens/aircraft_list/piper/piper_pa28_screen.dart';
import 'package:flight_maintenance_app/screens/aircraft_list/robin/alpha_robin_dr400_screen.dart';
import 'package:flight_maintenance_app/screens/aircraft_list/tecnam/tecnam_p2006t_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';

class AircraftMaintenanceAppMainScreen extends StatefulWidget {
  const AircraftMaintenanceAppMainScreen({super.key});

  @override
  State<AircraftMaintenanceAppMainScreen> createState() =>
      _AircraftMaintenanceAppMainScreenState();
}

class _AircraftMaintenanceAppMainScreenState
    extends State<AircraftMaintenanceAppMainScreen> {
  final List<String> aircraftList = [
    'Cessna 172',
    'Piper PA-28 Cherokee',
    'Beechcraft Bonanza',
    'Cirrus SR22',
    'Diamond DA40',
    'Mooney M20',
    'Grumman Tiger',
    'Tecnam P2006T',
    'Alpha Robin DR400',
    'Aero Commander 680'
  ];

  final Map<String, String> aircraftRoutes = {
    'Cessna 172': '/cessna172',
    'Piper PA-28 Cherokee': '/piperPa28',
    'Beechcraft Bonanza': '/beechcraftBonanza',
    'Cirrus SR22': '/cirrusSr22',
    'Diamond DA40': '/diamondDa40',
    'Mooney M20': '/mooneyM20',
    'Grumman Tiger': '/grummanTiger',
    'Tecnam P2006T': '/tecnamP2006t',
    'Alpha Robin DR400': '/alphaRobinDr400',
    'Aero Commander 680': '/aeroCommander680',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text('Aircraft Maintenance'),
      titleTextStyle:
          const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      backgroundColor: Colors.blueAccent,
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: aircraftList.length,
              itemBuilder: (context, index) {
                final aircraft = aircraftList[index];
                return GestureDetector(
                  onTap: () {
                    Logger().e("Tapped on $aircraft");
                    context.go(aircraftRoutes[aircraft]!);
                  },
                  child: Card(
                    child: ListTile(
                      title: Text(aircraftList[index]),
                      titleTextStyle:
                          const TextStyle(fontSize: 15, color: Colors.black),
                      subtitle: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Status: Available',
                              style: TextStyle(fontSize: 12)),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
