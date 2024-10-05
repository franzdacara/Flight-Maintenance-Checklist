// lib/constants.dart
import 'package:flight_maintenance_app/models/aircraft_model.dart';

List<Aircraft> aircraftList = [
  Aircraft(name: 'Propeller', isAvailable: true, route: '/propeller'),
  Aircraft(name: 'Fuselage', isAvailable: true, route: '/fuselage'),
  Aircraft(name: 'Wings', isAvailable: true, route: '/wings'),
  Aircraft(name: 'Landing Gear', isAvailable: false, route: '/landingGear'),
  Aircraft(name: 'Engine', isAvailable: false, route: '/engine'),
  Aircraft(name: 'Flaps', isAvailable: true, route: '/flaps'),
];
