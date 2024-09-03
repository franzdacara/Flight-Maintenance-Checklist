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

  final Map<String, Widget> aircraftScreens = {
    'Cessna 172': const Cessna172Screen(),
    'Piper PA-28 Cherokee': const PiperPA28Screen(),
    'Beechcraft Bonanza': const BeechcraftBonanzaScreen(),
    'Cirrus SR22': const CirrusSR22Screen(),
    'Diamond DA40': const DiamondDA40Screen(),
    'Mooney M20': const MooneyM20Screen(),
    'Grumman Tiger': const GrummanTigerScreen(),
    'Tecnam P2006T': const TecnamP2006TScreen(),
    'Alpha Robin DR400': const AlphaRobinDR400Screen(),
    'Aero Commander 680': const AeroCommander680Screen(),
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
      titleTextStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => aircraftScreens[aircraft]!,
                      ),
                    );
                  },
                  child: Card(
                    child: ListTile(
                      title: Text(aircraftList[index]),
                      titleTextStyle:
                          TextStyle(fontSize: 15, color: Colors.black),
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
