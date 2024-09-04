import 'package:flight_maintenance_app/screens/app/settings_screen.dart';
import 'package:flight_maintenance_app/utils/aircraftlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flight_maintenance_app/bloc/checkList/checklist_bloc.dart';
import 'package:flight_maintenance_app/screens/app/aircraft_card_screen.dart';

class AircraftMaintenanceAppMainScreen extends StatefulWidget {
  const AircraftMaintenanceAppMainScreen({super.key});

  @override
  State<AircraftMaintenanceAppMainScreen> createState() =>
      _AircraftMaintenanceAppMainScreenState();
}

class _AircraftMaintenanceAppMainScreenState
    extends State<AircraftMaintenanceAppMainScreen> {
  int _selectedIndex = 0;
  final ChecklistBloc _checklistBloc = ChecklistBloc();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _checklistBloc,
      child: Scaffold(
        appBar: _buildAppBar(),
        body: _selectedIndex == 0
            ? ListView.builder(
                itemCount: aircraftList.length,
                itemBuilder: (context, index) {
                  return AircraftCard(aircraft: aircraftList[index]);
                },
              )
            : const SettingsScreen(),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.airplane_ticket),
              label: 'Aircraft',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: _selectedIndex == 0
          ? const Text('Select Aircraft to Check Status')
          : const Text('Settings'),
      centerTitle: true,
      backgroundColor: Colors.blueGrey[400],
      elevation: 4.0,
      shadowColor: Colors.black54,
      titleTextStyle:
          const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
    );
  }
}
