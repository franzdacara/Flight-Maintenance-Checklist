// lib/constants.dart
import 'package:flight_maintenance_app/models/aircraft_model.dart';
import 'package:flight_maintenance_app/models/aircraft_steps.dart';

List<Aircraft> aircraftList = [
  Aircraft(name: 'Propeller', isAvailable: true, route: '/propeller'),
  Aircraft(name: 'Fuselage', isAvailable: true, route: '/fuselage'),
  Aircraft(name: 'Wings', isAvailable: false, route: '/wings'),
  Aircraft(name: 'Landing Gear', isAvailable: false, route: '/landingGear'),
  Aircraft(name: 'Engine', isAvailable: false, route: '/engine'),
  Aircraft(name: 'Flaps', isAvailable: true, route: '/flaps'),
];

List<AircraftSteps> aircrafSteps = [
  AircraftSteps(name: 'Removal', isAvailable: true, route: '/removal'),
  AircraftSteps(
      name: 'Cleaning / Inspection', isAvailable: true, route: '/cleanInspect'),
  AircraftSteps(name: 'Repair Work', isAvailable: true, route: '/repairWork'),
  AircraftSteps(
      name: 'Installation', isAvailable: true, route: '/installation'),
];
