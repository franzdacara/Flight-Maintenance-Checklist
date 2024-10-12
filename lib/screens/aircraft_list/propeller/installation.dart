import 'package:flight_maintenance_app/models/checklist_item.dart';
import 'package:flight_maintenance_app/utils/aircraftlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flight_maintenance_app/bloc/checkList/checklist_bloc.dart';

AppBar buildCommonAppBar(BuildContext context, String title) {
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
  );
}

class Installation extends StatefulWidget {
  const Installation({super.key});

  @override
  State<Installation> createState() => _InstallationState();
}

class _InstallationState extends State<Installation> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ChecklistBloc>(context)
        .add(LoadChecklist(installationChecklistItems));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCommonAppBar(context, 'Installation'),
      body: BlocBuilder<ChecklistBloc, ChecklistState>(
        builder: (context, state) {
          if (state is ChecklistInitial) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ChecklistLoaded) {
            // Check if the status is "Complete" or "Incomplete" and update `aircrafSteps[3].isComplete` accordingly
            WidgetsBinding.instance.addPostFrameCallback((_) {
              setState(() {
                if (state.status == 'Complete') {
                  aircrafSteps[3].isComplete = true;
                } else if (state.status == 'Incomplete') {
                  aircrafSteps[3].isComplete = false;
                }
              });
            });

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
    );
  }
}

class ChecklistCard extends StatelessWidget {
  final ChecklistItem item;
  final int index;

  const ChecklistCard({super.key, required this.item, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: CheckboxListTile(
          title: Text(
            item.title,
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
          value: item.isChecked,
          activeColor: Colors.green,
          checkColor: Colors.white,
          onChanged: (bool? value) {
            BlocProvider.of<ChecklistBloc>(context)
                .add(ToggleChecklistItem(index));
          },
          tileColor: Colors.blueGrey[50],
          contentPadding: const EdgeInsets.all(12.0),
        ),
      ),
    );
  }
}
