import 'package:flight_maintenance_app/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flight_maintenance_app/screens/aircraft_list/propeller/propeller.dart';
import 'package:flight_maintenance_app/screens/aircraft_list/fuselage/fuselage.dart';
import 'package:flight_maintenance_app/screens/aircraft_list/wings/wings.dart';
import 'package:flight_maintenance_app/screens/aircraft_list/landingGear/landingGear.dart';
import 'package:flight_maintenance_app/screens/aircraft_list/engine/engine.dart';
import 'package:flight_maintenance_app/screens/aircraft_list/flaps/flaps.dart';
import 'package:flight_maintenance_app/screens/app/aircraft_maintenace_app.dart';

final GoRouter _router = GoRouter(
  initialLocation: '/splash', 
  routes: [
    GoRoute(
      path: '/splash',
      pageBuilder: (context, state) {
        return MaterialPage<void>(
          key: state.pageKey,
          child: const SplashScreen(),
        );
      },
    ),
    GoRoute(
      path: '/',
      pageBuilder: (context, state) {
        return MaterialPage<void>(
          key: state.pageKey,
          child: const AircraftMaintenanceAppMainScreen(),
        );
      },
    ),

    GoRoute(
      path: '/wings',
      pageBuilder: (context, state) {
        return MaterialPage<void>(
          key: state.pageKey,
          child: const Wings(),
        );
      },
    ),
    GoRoute(
      path: '/flaps',
      pageBuilder: (context, state) {
        return MaterialPage<void>(
          key: state.pageKey,
          child: const Flaps(),
        );
      },
    ),
    GoRoute(
      path: '/fuselage',
      pageBuilder: (context, state) {
        return MaterialPage<void>(
          key: state.pageKey,
          child: const Fuselage(),
        );
      },
    ),   
    GoRoute(
      path: '/landingGear',
      pageBuilder: (context, state) {
        return MaterialPage<void>(
          key: state.pageKey,
          child: const LandingGear(),
        );
      },
    ),
    GoRoute(
      path: '/engine',
      pageBuilder: (context, state) {
        return MaterialPage<void>(
          key: state.pageKey,
          child: const Engine(),
        );
      },
    ),    
    
   
    GoRoute(
      path: '/propeller',
      pageBuilder: (context, state) {
        return MaterialPage<void>(
          key: state.pageKey,
          child: const Propeller(),
        );
      },
    ),
  ],
);

GoRouter get router => _router;
