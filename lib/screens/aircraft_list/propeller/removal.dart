import 'package:flight_maintenance_app/models/checklist_item.dart';
import 'package:flight_maintenance_app/screens/aircraft_list/propeller/clean_inspection.dart';
import 'package:flight_maintenance_app/utils/aircraftlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flight_maintenance_app/bloc/checkList/checklist_bloc.dart';

AppBar buildCommonAppBar(
    BuildContext context, String title, bool isNextEnabled) {
  return AppBar(
    title: Text(
      title,
      style: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    backgroundColor: Colors.blueGrey[400],
    centerTitle: true,
    leading: IconButton(
      icon: const Icon(Icons.arrow_back, color: Colors.white),
      onPressed: () {
        GoRouter.of(context).go('/propeller');
      },
    ),
    actions: const [
      // TextButton(
      //   onPressed: isNextEnabled
      //       ? () {
      //           GoRouter.of(context).go('/cleanInspect');
      //         }
      //       : null,
      //   style: TextButton.styleFrom(
      //     foregroundColor: isNextEnabled ? Colors.white : Colors.grey,
      //   ),
      //   child: const Text(
      //     'Next',
      //     style: TextStyle(
      //       fontSize: 15,
      //       fontWeight: FontWeight.bold,
      //     ),
      //   ),
      // ),
    ],
  );
}


class RemovalScreen extends StatefulWidget {
  const RemovalScreen({super.key});

  @override
  State<RemovalScreen> createState() => _RemovalScreenState();
}

class _RemovalScreenState extends State<RemovalScreen> {
  bool isNextEnabled = false;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ChecklistBloc>(context)
        .add(LoadChecklist(removalChecklistItems));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Build the AppBar outside of BlocBuilder
      appBar: buildCommonAppBar(context, 'Removal', isNextEnabled),
      body: BlocListener<ChecklistBloc, ChecklistState>(
        listener: (context, state) {
          if (state is ChecklistLoaded) {
            setState(() {
              if (state.status == 'Complete') {
                aircrafSteps[0].isComplete = true;
                isNextEnabled = true; // Enable Next button
              } else if (state.status == 'Incomplete') {
                aircrafSteps[0].isComplete = false;
                isNextEnabled = false; // Disable Next button
              }
            });
          }
        },
        child: BlocBuilder<ChecklistBloc, ChecklistState>(
          builder: (context, state) {
            if (state is ChecklistInitial) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ChecklistLoaded) {
              return Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.items.length,
                        itemBuilder: (context, index) {
                          final item = state.items[index];
                          return ChecklistCard(item: item, index: index);
                        },
                      ),
                    ),
                  ],
                ),
              );
            }
            return const Center(child: Text('No checklist items available'));
          },
        ),
      ),
    );
  }
}

