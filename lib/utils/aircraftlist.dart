// lib/constants.dart
import 'package:flight_maintenance_app/models/aircraft_model.dart';
import 'package:flight_maintenance_app/models/aircraft_steps.dart';
import 'package:flutter/material.dart';

List<Aircraft> aircraftList = [
  Aircraft(
    name: 'Propeller',
    isAvailable: true,
    route: '/propeller',
    icon: Icons.airplane_ticket_sharp,
  ),
  Aircraft(
    name: 'Fuselage',
    isAvailable: false,
    route: '/fuselage',
    icon: Icons.airplane_ticket_sharp,
  ),
  Aircraft(
    name: 'Wings',
    isAvailable: false,
    route: '/wings',
    icon: Icons.airplane_ticket_sharp,
  ),
  Aircraft(
    name: 'Landing Gear',
    isAvailable: false,
    route: '/landingGear',
    icon: Icons.airplane_ticket_sharp,
  ),
  Aircraft(
    name: 'Engine',
    isAvailable: false,
    route: '/engine',
    icon: Icons.airplane_ticket_sharp,
  ),
  Aircraft(
    name: 'Flaps',
    isAvailable: false,
    route: '/flaps',
    icon: Icons.airplane_ticket_sharp,
  ),
];

List<AircraftSteps> aircrafSteps = [
  AircraftSteps(
    name: 'Removal',
    isAvailable: true,
    route: '/removal',
  ),
  AircraftSteps(
    name: 'Cleaning / Inspection',
    isAvailable: true,
    route: '/cleanInspect',
  ),
  AircraftSteps(
    name: 'Repair Work',
    isAvailable: true,
    route: '/repairWork',
  ),
  AircraftSteps(
    name: 'Installation',
    isAvailable: true,
    route: '/installation',
  ),
];
