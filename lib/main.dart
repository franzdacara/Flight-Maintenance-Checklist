import 'package:flight_maintenance_app/bloc/checkList/checklist_bloc.dart';
import 'package:flight_maintenance_app/services/go_router_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChecklistBloc(), // Provide ChecklistBloc here
      child: MaterialApp.router(
        title: 'Aircraft Maintenance',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          fontFamily: 'CustomFont',
        ),
        routerConfig: router,
      ),
    );
  }
}
