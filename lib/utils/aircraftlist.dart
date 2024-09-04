// lib/constants.dart
import 'package:flight_maintenance_app/models/aircraft_model.dart';

List<Aircraft> aircraftList = [
  Aircraft(name: 'Cessna 172', isAvailable: true, route: '/cessna172'),
  Aircraft(
      name: 'Piper PA-28 Cherokee', isAvailable: true, route: '/piperPa28'),
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
      name: 'Alpha Robin DR400', isAvailable: false, route: '/alphaRobinDr400'),
  Aircraft(
      name: 'Aero Commander 680',
      isAvailable: false,
      route: '/aeroCommander680'),
];
