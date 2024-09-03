import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
import 'package:flight_maintenance_app/screens/app/aircraft_maintenace_app.dart';

final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: [
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
      path: '/cessna172',
      pageBuilder: (context, state) {
        return MaterialPage<void>(
          key: state.pageKey,
          child: const Cessna172Screen(),
        );
      },
    ),
    GoRoute(
      path: '/piperPa28',
      pageBuilder: (context, state) {
        return MaterialPage<void>(
          key: state.pageKey,
          child: const PiperPA28Screen(),
        );
      },
    ),
    GoRoute(
      path: '/beechcraftBonanza',
      pageBuilder: (context, state) {
        return MaterialPage<void>(
          key: state.pageKey,
          child: const BeechcraftBonanzaScreen(),
        );
      },
    ),
    GoRoute(
      path: '/cirrusSr22',
      pageBuilder: (context, state) {
        return MaterialPage<void>(
          key: state.pageKey,
          child: const CirrusSR22Screen(),
        );
      },
    ),
    GoRoute(
      path: '/diamondDa40',
      pageBuilder: (context, state) {
        return MaterialPage<void>(
          key: state.pageKey,
          child: const DiamondDA40Screen(),
        );
      },
    ),
    GoRoute(
      path: '/mooneyM20',
      pageBuilder: (context, state) {
        return MaterialPage<void>(
          key: state.pageKey,
          child: const MooneyM20Screen(),
        );
      },
    ),
    GoRoute(
      path: '/grummanTiger',
      pageBuilder: (context, state) {
        return MaterialPage<void>(
          key: state.pageKey,
          child: const GrummanTigerScreen(),
        );
      },
    ),
    GoRoute(
      path: '/tecnamP2006t',
      pageBuilder: (context, state) {
        return MaterialPage<void>(
          key: state.pageKey,
          child: const TecnamP2006TScreen(),
        );
      },
    ),
    GoRoute(
      path: '/alphaRobinDr400',
      pageBuilder: (context, state) {
        return MaterialPage<void>(
          key: state.pageKey,
          child: const AlphaRobinDR400Screen(),
        );
      },
    ),
    GoRoute(
      path: '/aeroCommander680',
      pageBuilder: (context, state) {
        return MaterialPage<void>(
          key: state.pageKey,
          child: const AeroCommander680Screen(),
        );
      },
    ),
  ],
);

GoRouter get router => _router;
